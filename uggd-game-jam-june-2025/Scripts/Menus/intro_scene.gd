extends Node

@export var scene_path = "res://Scenes/Menus/main_menu.tscn"

func _on_anim_animation_finished(_anim_name):
	get_tree().change_scene_to_file(scene_path)
