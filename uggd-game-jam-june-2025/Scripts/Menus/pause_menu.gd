extends Node2D

var open = false

func _ready():
	visible = false

func _unhandled_input(_event):
	if !open and Input.is_action_just_pressed("ui_cancel"):
		open = true
		visible = true
		Settings.player_can_move = false
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
	elif open and Input.is_action_just_pressed("ui_cancel"):
		close()
		
func close():
	open = false
	visible = false
	Settings.player_can_move = true
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_CAPTURED)

func _on_resume_pressed():
	close()

func _on_quit_pressed():
	$Anim.play("fade_out")

func _on_anim_animation_finished(_anim_name):
	Settings.player_can_move = true
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
