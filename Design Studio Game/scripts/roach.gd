extends CharacterBody2D


@export var _maxspeed:int = 150
@export var _accel:int=50


var _spritedir:Vector2=Vector2(0,-1)
var _intightspace:bool=false

@onready var _sprite=$Sprite2D
@onready var _anim=$AnimationTree
@onready var _statemachine=_anim.get("parameters/playback")

func _ready():
	_updateanim(_spritedir)

func _physics_process(delta):

	var direction = Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up")
		)
	if direction:
		velocity.y= move_toward(velocity.y,_maxspeed*direction.y,_accel)
	else:
		velocity.y = move_toward(velocity.y, 0, _accel)
	if direction:
		velocity.x=move_toward(velocity.x,_maxspeed*direction.x,_accel)
	else:
		velocity.x = move_toward(velocity.x, 0, _accel)
		
	if(!_intightspace):
		_updateanim(direction)
	
	move_and_slide()
	_changestate()





func _updateanim(dir:Vector2):
	if(dir!=Vector2.ZERO):
		_anim.set("parameters/idle/blend_position",dir)
		_anim.set("parameters/run/blend_position",dir)
func _changestate():
	if(velocity!=Vector2.ZERO):
		_statemachine.travel("run")
	else:
		_statemachine.travel("idle")

func _on_area_2d_body_entered(body):
	_intightspace=true
func _on_area_2d_body_exited(body):
	_intightspace=false
