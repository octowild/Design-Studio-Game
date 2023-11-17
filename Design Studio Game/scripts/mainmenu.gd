extends Control

@onready var _cutscene = $VideoStreamPlayer
@onready var play = $play
@onready var quit = $quit
@onready var credits = $credits
@onready var skip = $skip

func _ready():
	skip.visible=false
	skip.modulate.a=0
	
func _process(delta):
	pass

func _on_play_pressed():
	play.visible=false
	quit.visible=false
	credits.visible=false
	skip.visible=true
	skip.modulate.a=0.8
	_cutscene.play()
	


func _on_quit_pressed():
	get_tree().quit()

func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://scenes/bathfloor1.tscn")

func _on_skip_pressed():
	get_tree().change_scene_to_file("res://scenes/bathfloor1.tscn")
	print("skip")
