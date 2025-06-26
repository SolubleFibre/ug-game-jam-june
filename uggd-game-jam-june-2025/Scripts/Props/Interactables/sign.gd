extends Node3D

signal end_scene 

func _on_input_detector_open_ui():
	Settings.subtext_contents = "There's only one way for you to go."
	Settings.show_subtext = true
	end_scene.emit()
