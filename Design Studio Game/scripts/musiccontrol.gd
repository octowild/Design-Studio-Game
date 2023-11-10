extends AudioStreamPlayer
var _curscn
@onready var _musicplayer=$AudioStreamPlayer

func _ready():
	pass # Replace with function body.


func _process(delta):
	_curscn=get_tree().current_scene.name
	if _curscn=="bathfloor1":
		_musicplayer.source()
	elif _curscn=="pipes1":
		_musicplayer.source()
