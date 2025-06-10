extends Node3D

@export var keep_close = false
@export var keep_open = false

func _ready():
	var random_chance = randi_range(0,1)
	if keep_close:
		$DoorHalves/DoorAnims.play_backwards("open")
	elif keep_open:
		$DoorHalves/DoorAnims.play("open")
	elif !keep_close and !keep_open:
		if random_chance == 0:
			$DoorHalves/DoorAnims.play("open")
		elif random_chance == 1:
			$DoorHalves/DoorAnims.play_backwards("open")
