extends CharacterBody2D


@export var _maxspeed:int = 350
@export var _accel:int=50

@export var _spritedir:Vector2=Vector2(0,-1)

@onready var _anim=$AnimationTree

func _ready():
	_updateanim(_spritedir)

func _physics_process(delta):

	var direction = Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up")
		)
	_updateanim(direction)
	
	if direction:
		velocity.y= move_toward(velocity.y,_maxspeed*direction.y,_accel)
	else:
		velocity.y = move_toward(velocity.y, 0, _accel)
	if direction:
		velocity.x=move_toward(velocity.x,_maxspeed*direction.x,_accel)
	else:
		velocity.x = move_toward(velocity.x, 0, _accel)

	move_and_slide()
func _updateanim(dir:Vector2):
	if(dir!=Vector2.ZERO):
		_anim.set("parameters/idle/blend_position",dir)
