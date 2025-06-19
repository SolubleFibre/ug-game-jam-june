extends Node3D

@export var ui_scene : PackedScene
var in_range = false
var open = false

func _ready():
	var instance = ui_scene.instantiate() 
	$Scaler.add_child(instance)

func _unhandled_input(_event):
	if in_range and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if !open:
			open = true
			$Scaler/Anims.play("open")
			Settings.player_can_move = false
			DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
	elif in_range and Input.is_action_just_pressed("ui_cancel"):
		if open:
			open = false
			$Scaler/Anims.play_backwards("open")
			Settings.player_can_move = true
			DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_CAPTURED)

func _on_body_entered(_body):
	in_range = true

func _on_body_exited(_body):
	in_range = false
