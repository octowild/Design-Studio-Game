extends Control

@onready var animated_sprite_2d = $Panel/AnimatedSprite2D
@onready var label = $Panel/Label
@onready var _timer = $Timer
@onready var _bg = $Panel/Panel
@onready var retry = $Panel/retry
@onready var _return = $Panel/return
@onready var deathscreen = $Panel/deathscreen
@onready var endscreen = $Panel/endscreen
@onready var pipesarc = $Panel/pipesarc

@export var _mc:CharacterBody2D

var fade=false
var wasd=true
var direction

func _ready():
	_bg.modulate=Color(0,0,0,0)
	retry.disabled=true
	retry.modulate=Color(1,1,1,0)
	_return.disabled=true
	_return.modulate=Color(1,1,1,0)
	deathscreen.modulate=Color(0,0,0,0)
	endscreen.modulate=Color(0,0,0,0)
	pipesarc.modulate=Color(0,0,0,0)
	if get_tree().current_scene.name=="bathfloor1":
		_setopacity()

func _process(delta):
	if get_tree().current_scene.name=="bathfloor1":
		_tutorial()
	if _mc._isded==true:
		deathscreen.modulate=lerp(deathscreen.modulate,Color(1,1,1,0.9),0.05)
		retry.disabled=false
		retry.modulate=Color(1,1,1,1)
		_return.disabled=false
		_return.modulate=Color(1,1,1,1)
		fade=true
	_areacard()
	

func _on_timer_timeout():
	animated_sprite_2d.play("shift")
	label.text=("SHIFT to Dash")
	fade=false
	
func _setopacity():
	label.modulate.a=1
	animated_sprite_2d.modulate.a=1
	
func _tutorial():
	direction = Vector2(
	Input.get_action_strength("right")-Input.get_action_strength("left"),
	Input.get_action_strength("down")-Input.get_action_strength("up")
	)
	if direction&&wasd:
		await get_tree().create_timer(2).timeout
		fade=true
		_timer.start()
	if (Input.get_action_strength("dash")):
		await get_tree().create_timer(2).timeout
		fade=true
	if fade:
		animated_sprite_2d.modulate.a=lerp(animated_sprite_2d.modulate.a,0.0,0.05)
		label.modulate.a=lerp(label.modulate.a,0.0,0.05)
		wasd=false
	else:
		animated_sprite_2d.modulate.a=lerp(animated_sprite_2d.modulate.a,255.0,0.005)
		label.modulate.a=lerp(label.modulate.a,255.0,0.005)
		
func _areacard():
	if get_tree().current_scene.name=="pipes1":
		pipesarc.modulate=lerp(pipesarc.modulate,Color(1,1,1,0.9),0.05)
		await get_tree().create_timer(5).timeout
		pipesarc.modulate.a=lerp(pipesarc.modulate.a,-1.0,0.05)

func _on_retry_pressed():
	get_tree().reload_current_scene()

func _on_exit_body_entered(body):
	if body.name=="WhiteMCRoach":
		endscreen.modulate=Color(1,1,1,1)
		_return.disabled=false
		_return.modulate=Color(1,1,1,1)
		_mc._movelock=true

func _on_return_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
