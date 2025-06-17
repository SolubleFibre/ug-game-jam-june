extends Node3D

var in_range = false
var open = false
signal open_ui
signal close_ui

func _unhandled_input(_event):
	if in_range and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if !open:
			open = true
			open_ui.emit()
		elif open:
			open = false
			close_ui.emit()

func _on_body_entered(_body):
	in_range = true

func _on_body_exited(_body):
	in_range = false
