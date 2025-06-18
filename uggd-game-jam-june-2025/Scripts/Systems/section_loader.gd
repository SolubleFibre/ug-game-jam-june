extends Area3D

@export var disabled_node : Node
@export var keep_loaded = false

func _ready():
	if disabled_node and !keep_loaded:
		disabled_node.visible = false
	elif keep_loaded:
		disabled_node.visible = true

func _process(_delta):
	if keep_loaded:
		disabled_node.visible = true

func _on_area_entered(_area):
	if disabled_node:
		disabled_node.visible = true

func _on_area_exited(_area):
	if disabled_node and !keep_loaded:
		disabled_node.visible = false
