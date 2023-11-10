extends CharacterBody2D


@export var _speed:int = 150
@export var _dashstr:int=3


var _spritedir:Vector2=Vector2(0,-1)
var _intightspace:bool=false
var _isded:bool=false
var _dash:bool=false
var _movelock:bool=false

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
	if (Input.is_action_just_pressed("dash")&&!_movelock):
		_dash=true
		_movelock=true
	if (direction&&!_movelock):
		velocity= lerp(velocity,direction*_speed,0.2)
	else:
		velocity = lerp(velocity,Vector2(0,0),0.2)
	if(_dash):
		velocity=lerp(velocity,velocity*_dashstr,0.2)
		if velocity.length()>=600:
			_dash=false
			_movelock=false
		
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
	print(_isded)
	move_and_slide()
	_changestate()





func _updateanim(dir:Vector2):
	if(dir!=Vector2.ZERO):
		_anim.set("parameters/idle/blend_position",dir)
		_anim.set("parameters/run/blend_position",dir)
func _changestate():
	if(abs(velocity.x)+abs(velocity.y)>=5):
		_statemachine.travel("run")
	else:
		_statemachine.travel("idle")

func _on_area_2d_body_entered(body):
	_intightspace=true
func _on_area_2d_body_exited(body):
	_intightspace=false
