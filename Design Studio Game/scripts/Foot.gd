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
@onready var _col=$Foot/kill/CollisionShape2D

func _physics_process(delta):
	if (!_stamp&&!_mc._insafezone):
		_mcpos=_mc.position
		position=lerp(position,_mcpos,_movespeed/75)
		if(foot.position.y>=-500):
			foot.position.y-=50
		#foot.position=lerp(foot.position,Vector2(position.x,position.y-1000),_fallspeed/200)
		shadow.scale=lerp(shadow.scale,Vector2(0.5,0.5),_shadowspeed/25)
	else:
		shadow.scale=lerp(shadow.scale,Vector2(1,1),_shadowspeed/75)
		if shadow.scale.x>=0.8:
			foot.position.y-=lerp(foot.position.y,float(0),_fallspeed/7)
	if foot.position.y<-5:
		_col.disabled=true
	else:
		_col.disabled=false
	if _mc._insafezone:
		position=Vector2(1000,1000)

func _on_trig_body_entered(body):
	if(body.name=="WhiteMCRoach"):
		_stamp=true
		foot.position.y=position.y-1000
		_timer.start()

func _on_timer_timeout():
	_stamp=false

func _on_kill_body_entered(body):
	if(body.name=="WhiteMCRoach"):
		_mc._isded=true
		
