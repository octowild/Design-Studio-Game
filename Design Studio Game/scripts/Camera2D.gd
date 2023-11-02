extends Camera2D

@export var _maxspeed:int = 150
@export var _accel:int=50

func _physics_process(delta):
	var direction = Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up")
		)
