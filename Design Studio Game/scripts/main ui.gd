extends Control

@onready var animated_sprite_2d = $Panel/AnimatedSprite2D
@onready var label = $Panel/Label
@onready var _timer = $Timer
@onready var _bg = $Panel

@export var _mc:CharacterBody2D

var fade=false
var wasd=true
var direction
var new_style = StyleBoxFlat.new()

func _process(delta):
	direction = Vector2(
	Input.get_action_strength("right")-Input.get_action_strength("left"),
	Input.get_action_strength("down")-Input.get_action_strength("up")
	)
	if direction&&wasd:
		fade=true
		_timer.start()
	if (Input.get_action_strength("dash")):
		fade=true
	if fade:
		animated_sprite_2d.modulate.a=lerp(animated_sprite_2d.modulate.a,0.0,0.05)
		label.modulate.a=lerp(label.modulate.a,0.0,0.05)
		wasd=false
	else:
		animated_sprite_2d.modulate.a=lerp(animated_sprite_2d.modulate.a,255.0,0.005)
		label.modulate.a=lerp(label.modulate.a,255.0,0.005)
	
	#new_style.set_bg_color(Color(1,0,0,0))
	if _mc._isded==true:
		new_style.set_bg_color(Color(255,0,0,255))
	

	
	_bg.set('custom_styles/panel', new_style)

func _on_timer_timeout():
	animated_sprite_2d.play("shift")
	label.text=("SHIFT to Dash")
	fade=false
