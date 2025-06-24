extends Node3D

signal open_door

@export var update_values = false ##Set this to true to have the terminal update as soon as it's instantiated (Highly recommended)
@export var puzzle_mode : int ##Presets: 0 for no puzzle required, 1 for collecting-based puzzles, and 2 for an exterior-related puzzled
@export var collect_amount : int ##Amount of items that need to be collected. Has no effect if puzzle mode is anything other than 1
@export var exterior_puzzle_complete : bool ##State for whether the puzzle is complete or not. Has no effect is puzzle mode is anything other than 2
var drawer_open = false

func _process(_delta):
	if update_values:
		update()
		update_values = false
	
	if puzzle_mode == 1 and PuzzleManager.collected == collect_amount:
		open_door.emit()
		PuzzleManager.collected = 0
		if drawer_open:
			drawer_open = false
			$Terminal/Drawer/DrawerAnims.play_backwards("open")
	elif puzzle_mode == 2 and exterior_puzzle_complete:
		open_door.emit()
		exterior_puzzle_complete = false

func update():
	if puzzle_mode == 0:
		open_door.emit()
		if drawer_open:
			drawer_open = false
			$Terminal/Drawer/DrawerAnims.play_backwards("open")
	elif puzzle_mode == 1 and !drawer_open:
		drawer_open = true
		$Terminal/Drawer/DrawerAnims.play("open")
	elif puzzle_mode == 2:
		if drawer_open:
			drawer_open = false
			$Terminal/Drawer/DrawerAnims.play_backwards("open")
	
	PuzzleManager.mode = puzzle_mode
	PuzzleManager.collect_num = collect_amount
