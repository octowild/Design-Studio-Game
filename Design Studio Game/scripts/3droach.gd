extends CharacterBody3D


@export var _maxspeed:float = 350
@export var _accel:float=50

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

	move_and_slide()
