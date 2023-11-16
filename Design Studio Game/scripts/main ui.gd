extends Control

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var label = $Label

func _process(delta):
	var direction = Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up")
		)
		
