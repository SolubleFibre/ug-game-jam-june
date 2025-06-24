extends Node

func _on_anim_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
