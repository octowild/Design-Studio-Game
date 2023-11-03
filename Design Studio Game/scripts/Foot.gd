extends CharacterBody2D

@export var _mcs:Script
@export var _mc:CharacterBody2D

@export var _movespeed:float=5
@export var _shadowspeed:float=2
@export var _fallspeed:float=4

var _stamp:bool=false
var _contact:bool=false
var _mcpos

@onready var shadow=$Shadow
@onready var foot=$Foot
@onready var _timer=$Timer

func _physics_process(delta):
	if (!_stamp):
		_mcpos=_mc.position
		position=lerp(position,_mcpos,_movespeed/100)
		if(foot.position.y<=250):
			foot.position.y-=50
		#foot.position=lerp(foot.position,Vector2(position.x,position.y-1000),_fallspeed/200)
		shadow.scale=lerp(shadow.scale,Vector2(0.5,0.5),_shadowspeed/25)
	else:
		foot.position.y=lerp(foot.position.y,position.y,_fallspeed/100)
		shadow.scale=lerp(shadow.scale,Vector2(1,1),_shadowspeed/100)
	print(foot.position)


func _on_trig_body_entered(body):
	_stamp=true
	foot.position.y=position.y-250
	_timer.start()

func _on_timer_timeout():
	_contact=true
	_stamp=false

func _on_kill_body_entered(body):
	pass
	#if(_contact):
	#	_mcs._isded=true
