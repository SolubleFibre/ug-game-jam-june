extends Node3D

@export var current_loop : int = 0## set to 0 by default, don't question it
@onready var puzzle_terminal = $Pixelizer/SubViewport/MazeRegions/EndCorridor/PuzzleTerminal

func _ready():
	loop_decider()

func reset_puzzle_postions():
	$Pixelizer/SubViewport/MazeRegions/Puzzles/JigsawCollection.position.y = 400
	$Pixelizer/SubViewport/MazeRegions/Puzzles/Metallurgy.position.y = 450
	$Pixelizer/SubViewport/MazeRegions/Puzzles/PoolPuzzle.position.y = 500
	$Pixelizer/SubViewport/MazeRegions/PoolHall/DarkPool.current_state = 0
	$Pixelizer/SubViewport/MazeRegions/Puzzles/ComputersPuzzle.position.y = 550
	$Pixelizer/SubViewport/MazeRegions/Puzzles/PipePuzzle.position.y = 600
	$Pixelizer/SubViewport/MazeRegions/Puzzles/LoreNotes.position.y = 650

func start_new_loop():
	current_loop += 1
	PuzzleManager.randomize_doors = true
	$Pixelizer/SubViewport/Player.position = Vector3(-55.86, 1.294, 40.0)
	$Pixelizer/SubViewport/Player.rotation = Vector3(0,-90,0)

func loop_decider():
	start_new_loop()
	reset_puzzle_postions()
	print(current_loop)
	#Do not under any but the most dire situations, mess with the code below.
	#At your time of reading there may not be much here, but the amount of stuff
	#that will need to be here is MASSIVE and complex, so, yk, no touchy.
	if current_loop == 1 or current_loop == 5 or current_loop == 6:
		$Screenfader/TitleText.text = "FIND THE WAY OUT."
		puzzle_terminal.puzzle_mode = 0
		puzzle_terminal.update_values = true
	elif current_loop == 2 or current_loop == 7:
		$Screenfader/TitleText.text = "COLLECT THE PIECES."
		puzzle_terminal.puzzle_mode = 1
		puzzle_terminal.collect_amount = 3
		puzzle_terminal.update_values = true
		$Pixelizer/SubViewport/MazeRegions/Puzzles/JigsawCollection.position.y = 0
	elif current_loop == 3 or current_loop == 9:
		$Screenfader/TitleText.text = "SMELT THE METAL."
		puzzle_terminal.puzzle_mode = 2
		puzzle_terminal.update_values = true
		$Pixelizer/SubViewport/MazeRegions/Puzzles/Metallurgy.position.y = 0
	elif current_loop == 4:
		$Screenfader/TitleText.text = "SEEK THE HOLY TEARS."
		$Pixelizer/SubViewport/MazeRegions/PoolHall/DarkPool.current_state = 1
		puzzle_terminal.puzzle_mode = 2
		puzzle_terminal.update_values = true
		$Pixelizer/SubViewport/MazeRegions/Puzzles/PoolPuzzle.position.y = 0
	elif current_loop == 10 or current_loop == 8:
		$Screenfader/TitleText.text = "ACTIVATE THE DEVICES."
		puzzle_terminal.puzzle_mode = 1
		puzzle_terminal.collect_amount = 3
		puzzle_terminal.update_values = true
		$Pixelizer/SubViewport/MazeRegions/Puzzles/ComputersPuzzle.position.y = 0
	elif current_loop == 11:
		$Screenfader/TitleText.text = "CORRECT THE PIPES."
		puzzle_terminal.puzzle_mode = 1
		puzzle_terminal.collect_amount = 1
		puzzle_terminal.update_values = true
		$Pixelizer/SubViewport/MazeRegions/Puzzles/PipePuzzle.position.y = 0
	elif current_loop == 12:
		$Screenfader/TitleText.text = "RECALL THE PAST."
		$BackgroundMusic.stop()
		$LastLoopMusic.play()
		puzzle_terminal.puzzle_mode = 1
		puzzle_terminal.collect_amount = 5
		puzzle_terminal.update_values = true
		$Pixelizer/SubViewport/MazeRegions/Puzzles/LoreNotes.position.y = 0

func _on_puzzle_terminal_open_door():
	$Pixelizer/SubViewport/MazeRegions/EndCorridor/LargeHall2/EndDoor.open_door = true

func _on_end_passage_body_entered(_body):
	if current_loop != 12:
		loop_decider()
		$Screenfader/ScreenAnims.play("restart_loop")
		$Pixelizer/SubViewport/MazeRegions/EndCorridor/LargeHall2/EndDoor.close_door = true
	elif current_loop == 12:
		$Screenfader/ScreenAnims.play("end_fade")

func _on_screen_anims_animation_finished(anim_name):
	if anim_name == "end_fade":
		get_tree().change_scene_to_file("res://Scenes/Game World/end_scene.tscn")
