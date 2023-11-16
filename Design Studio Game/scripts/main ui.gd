extends Control

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var label = $Label
@onready var _timer = $Timer
var fade=false
var wasd=true
var direction

func _process(delta):
		direction = Vector2(
		Input.get_action_strength("right")-Input.get_action_strength("left"),
		Input.get_action_strength("down")-Input.get_action_strength("up")
		)
		if direction&&wasd:
			fade=true
			_timer.start()
		if fade:
			animated_sprite_2d.modulate.a=lerp(animated_sprite_2d.modulate.a,0.0,0.05)
			label.modulate.a=lerp(label.modulate.a,0.0,0.05)
			wasd=false

func _on_timer_timeout():
	animated_sprite_2d.play("shift")
	label.text=("SHIFT to Dash")
	animated_sprite_2d.modulate.a=lerp(animated_sprite_2d.modulate.a,255.0,0.01)
	label.modulate.a=lerp(label.modulate.a,255.0,0.01)
	fade=false
