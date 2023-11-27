extends CharacterBody2D


@export var _speed:int = 150
@export var _dashstr:int=600

var _spritedir:Vector2=Vector2(0,-1)
var _intightspace:bool=false
var _isded:bool=false
var _dash:bool=false
var _movelock:bool=false
var _dashlock:bool=false
var _insafezone:bool=false

@onready var _anim=$AnimationTree
@onready var _statemachine=_anim.get("parameters/playback")
@onready var _collider=$CollisionShape2D2
@onready var _trigcol=$Area2D/CollisionShape2D2
@onready var _dashcd=$dashcd

func _ready():
	_updateanim(_spritedir)

func _physics_process(delta):
	var direction = Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up")
		)
	if (Input.is_action_just_pressed("dash")&&!_movelock&&!_dashlock):
		_dash=true
		_movelock=true
		_dashlock=true
	if (direction&&!_movelock):
		velocity= lerp(velocity,direction*_speed,0.2)
	else:
		velocity = lerp(velocity,Vector2(0,0),0.2)
	if(_dash):
		velocity=lerp(velocity,velocity.normalized()*_dashstr,0.3)
		
		#if(velocity.length()<=450):
		#	velocity*=_dashstr
		#else:
		#	_movelock=false
		#	_dash=false

	if (abs(velocity.x)<abs(velocity.y)):
		_collider.set_rotation_degrees(0)
		_trigcol.set_rotation_degrees(0)
	elif(abs(velocity.x)>abs(velocity.y)):
		_collider.set_rotation_degrees(90)
		_trigcol.set_rotation_degrees(90)
	elif(velocity.x!=0&&abs(velocity.x)==abs(velocity.y)):
		_collider.set_rotation_degrees(90)
		_trigcol.set_rotation_degrees(90)

	if(!_intightspace):
		_updateanim(direction)
	if _isded:
		_movelock=true
	move_and_slide()
	_changestate()

func _process(delta):
	if(_dash):
		await get_tree().create_timer(0.3).timeout
		#if velocity.length()>=600:
		_dash=false
		_movelock=false
		await get_tree().create_timer(0.7).timeout
		_dashlock=false
		




func _updateanim(dir:Vector2):
	if(dir!=Vector2.ZERO):
		_anim.set("parameters/idle/blend_position",dir)
		_anim.set("parameters/run/blend_position",dir)
func _changestate():
	if(abs(velocity.x)+abs(velocity.y)>=5):
		_statemachine.travel("run")
	elif !_isded:
		_statemachine.travel("idle")
	elif _isded:
		_statemachine.travel("death_right")

func _on_area_2d_body_entered(body):
	_intightspace=true
func _on_area_2d_body_exited(body):
	_intightspace=false

func _on_nofootzone_area_entered(area):
	_insafezone=true

func _on_nofootzone_area_exited(area):
	_insafezone=false
