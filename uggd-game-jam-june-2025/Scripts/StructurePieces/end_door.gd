extends Node3D

@export var open_door = false
@export var close_door = false

func _process(_delta):
	if open_door:
		open_door = false
		$DoorHalves/DoorAnims.play("open")
	elif close_door:
		close_door = false
		$DoorHalves/DoorAnims.play_backwards("open")
