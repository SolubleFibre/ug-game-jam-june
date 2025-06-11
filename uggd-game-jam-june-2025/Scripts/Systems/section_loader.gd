extends Area3D

@export var disabled_node : Node

func _ready():
	if disabled_node:
		disabled_node.visible = false

func _on_area_entered(_area):
	if disabled_node:
		disabled_node.visible = true

func _on_area_exited(_area):
	if disabled_node:
		disabled_node.visible = false
