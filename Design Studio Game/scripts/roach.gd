extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta):

	var directionx = Input.get_axis("a", "d")
	var directiony = Input.get_axis("w", "s")
	
	if directiony:
		velocity.y=directiony*SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
