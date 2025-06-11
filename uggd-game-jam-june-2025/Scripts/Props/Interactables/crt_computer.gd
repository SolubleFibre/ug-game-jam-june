extends Node3D

var in_range = false
var activated = false

func _unhandled_input(_event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and in_range and !activated:
		activated = true
		$Anims.play("activate")

func _on_detector_body_entered(_body):
	in_range = true

func _on_detector_body_exited(_body):
	in_range = false
