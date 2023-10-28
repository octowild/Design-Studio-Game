extends Area2D








func _on_area_entered(area):
	#var simultaneous_scene = preload("res://scenes/pipes1.tscn").instantiate()
	#get_tree().root.add_child(simultaneous_scene)
	get_tree().change_scene_to_file("res://scenes/pipes1.tscn")
