extends Node3D

@export var keep_close = false
@export var keep_open = false
@export var randomly_open = false

func randomize_door_opening():
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

func _ready():
	randomize_door_opening()

func _process(_delta):
	if randomly_open:
		randomly_open = false
		randomize_door_opening()
	
	if PuzzleManager.randomize_doors:
		randomize_door_opening()
		PuzzleManager.randomize_doors = false
