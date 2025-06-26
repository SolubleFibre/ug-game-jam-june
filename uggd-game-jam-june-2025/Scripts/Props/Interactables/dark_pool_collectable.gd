extends Node3D

@export var collected = false

func _on_detector_body_entered(_body):
	collected = true
