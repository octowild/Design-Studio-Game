extends Control

@onready var _cutscene = $VideoStreamPlayer
@onready var play = $play
@onready var quit = $quit
@onready var credits = $credits
@onready var skip = $skip
@onready var back = $back


func _ready():
	skip.visible=false
	skip.modulate.a=0
	back.visible=false
	
func _process(delta):
	pass

func _on_play_pressed():
	_buttonvisiblity(false)
	skip.visible=true
	skip.modulate.a=0.8
	back.visible=false
	_cutscene.play()
	


func _on_quit_pressed():
	get_tree().quit()

func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://scenes/bathfloor1.tscn")

func _on_skip_pressed():
	get_tree().change_scene_to_file("res://scenes/bathfloor1.tscn")
	
func _buttonvisiblity(val:bool):
	play.visible=val
	quit.visible=val
	credits.visible=val


func _on_credits_pressed():
	_buttonvisiblity(false)
	back.visible=true

func _on_back_pressed():
	_buttonvisiblity(true)
	back.visible=false
