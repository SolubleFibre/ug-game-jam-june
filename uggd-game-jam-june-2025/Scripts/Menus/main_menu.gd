extends Node

var leaving = false
var exit_code = 0

func _on_play_button_pressed():
	leaving = true
	exit_code = 1
	$Modulator/Anims.play_backwards("appear")

func _on_exit_button_pressed():
	leaving = true
	exit_code = 2
	$Modulator/Anims.play_backwards("appear")

func _on_anims_animation_finished(_anim_name):
	if leaving:
		if exit_code == 1:
			get_tree().change_scene_to_file("res://Scenes/Game World/main_scene.tscn")
		if exit_code == 2:
			get_tree().quit()
