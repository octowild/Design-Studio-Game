extends CharacterBody2D


var _maxspeed = 350

var _accel=50

func _ready():
	get_node("AnimatedSprite2D")

func _physics_process(delta):

	var directionx = Input.get_axis("ui_left", "ui_right")
	var directiony = Input.get_axis("ui_up", "ui_down")
	
	if directiony:
		velocity.y=move_toward(velocity.y,_maxspeed*directiony,_accel)
	else:
		velocity.y = move_toward(velocity.y, 0, _accel)
	if directionx:
		velocity.x=move_toward(velocity.x,_maxspeed*directionx,_accel)

	else:
		velocity.x = move_toward(velocity.x, 0, _accel)

	move_and_slide()
