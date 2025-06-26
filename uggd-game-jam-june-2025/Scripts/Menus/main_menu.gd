extends Node

@onready var settings_menu = $MenuElements/Border/Settings
var leaving = false
var exit_code = 0

func close_settings():
	if settings_menu.open:
		settings_menu.toggle_state = true

func _on_play_button_pressed():
	leaving = true
	exit_code = 1
	$Modulator/Anims.play_backwards("appear")
	close_settings()

func _on_exit_button_pressed():
	leaving = true
	exit_code = 2
	$Modulator/Anims.play_backwards("appear")
	close_settings()

func _on_anims_animation_finished(_anim_name):
	if leaving:
		if exit_code == 1:
			get_tree().change_scene_to_file("res://Scenes/Menus/beginning_paragraph.tscn")
		if exit_code == 2:
			get_tree().quit()
