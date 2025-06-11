@tool
extends MeshInstance3D

@export var enable_corner_pillars = false

func _process(_delta):
	if !enable_corner_pillars:
		$Pillars.visible = false
	elif enable_corner_pillars:
		$Pillars.visible = true
