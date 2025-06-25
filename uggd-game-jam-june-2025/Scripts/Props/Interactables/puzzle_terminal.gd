extends Node3D

signal open_door

@export var update_values = false ##Set this to true to have the terminal update as soon as it's instantiated (Highly recommended)
@export var puzzle_mode : int ##Presets: 0 for no puzzle required, 1 for collecting-based puzzles, and 2 for an exterior-related puzzled
@export var collect_amount : int ##Amount of items that need to be collected. Has no effect if puzzle mode is anything other than 1
@export var exterior_puzzle_complete : bool ##State for whether the puzzle is complete or not. Has no effect is puzzle mode is anything other than 2
var drawer_open = false
var can_open_door = false
var in_range = false

func _unhandled_input(_event):
	if can_open_door and in_range and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		open_door.emit()
		can_open_door = false
		$DoorOpened.play()

func _process(_delta):
	
	if can_open_door:
		$Terminal/Screen.visible = true
	else: $Terminal/Screen.visible = false
	
	if update_values:
		update()
		update_values = false
	
	if puzzle_mode == 1 and PuzzleManager.collected == collect_amount:
		can_open_door = true
		PuzzleManager.collected = 0
		Settings.subtext_contents = "THE WAY IS NOW OPEN."
		Settings.show_subtext = true
		if drawer_open:
			drawer_open = false
			$Terminal/Drawer/DrawerAnims.play_backwards("open")
	elif puzzle_mode == 2 and PuzzleManager.exterior_puzzle_complete:
		can_open_door = true
		PuzzleManager.exterior_puzzle_complete = false
		Settings.subtext_contents = "THE WAY IS NOW OPEN."
		Settings.show_subtext = true

func update():
	if puzzle_mode == 0:
		can_open_door = true
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

func _on_detector_body_entered(_body):
	in_range = true

func _on_detector_body_exited(_body):
	in_range = false
