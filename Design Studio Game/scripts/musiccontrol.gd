extends AudioStreamPlayer
var _curscn

func _ready():
	pass # Replace with function body.


func _process(delta):
	_curscn=get_tree().current_scene.name
	if _curscn=="bathfloor1":
		if Backgroundmusic.stream != load("res://objects/Goliath_trimmed.mp3"):
			Backgroundmusic.stop()
			Backgroundmusic.stream = load("res://objects/Goliath_trimmed.mp3")
			Backgroundmusic.play()
	elif _curscn=="pipes1":
		if Backgroundmusic.stream != load("res://objects/No_Return_trimmed.mp3"):
			Backgroundmusic.stop()
			Backgroundmusic.stream = load("res://objects/No_Return_trimmed.mp3")
			Backgroundmusic.play()
	elif _curscn=="Control":
		Backgroundmusic.stop()
