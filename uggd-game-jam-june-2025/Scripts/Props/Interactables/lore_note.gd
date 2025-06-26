extends Node3D

@export_multiline var lore_note_contents : String
var has_been_collected = false

func _on_menu_opener_body_entered(_body):
	Settings.lore_text = lore_note_contents

func _on_input_detector_open_ui():
	if !has_been_collected:
		PuzzleManager.collected += 1
		has_been_collected = true
		
