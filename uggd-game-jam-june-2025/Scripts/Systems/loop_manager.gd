extends Node3D

@export var current_loop : int = -1## set to -1 by default, don't question it
@onready var puzzle_terminal = $Pixelizer/SubViewport/MazeRegions/EndCorridor/PuzzleTerminal

func _ready():
	loop_decider()

func reset_puzzle_postions():
	$Pixelizer/SubViewport/MazeRegions/Puzzles/JigsawCollection.position.y = 400

func start_new_loop():
	current_loop += 1
	$Pixelizer/SubViewport/Player.position = Vector3(-55.86, 1.294, 40.0)
	$Pixelizer/SubViewport/Player.rotation = Vector3(0,-90,0)

func loop_decider():
	start_new_loop()
	reset_puzzle_postions()
	#Do not under any but the most dire situations, mess with the code below.
	#At your time of reading there may not be much here, but the amount of stuff
	#that will need to be here is MASSIVE and complex, so, yk, no touchy.
	if current_loop == 0:
		puzzle_terminal.puzzle_mode = 0
		puzzle_terminal.update_values = true
	elif current_loop == 1:
		puzzle_terminal.puzzle_mode = 1
		puzzle_terminal.collect_amount = 3
		puzzle_terminal.update_values = true
		$Pixelizer/SubViewport/MazeRegions/Puzzles/JigsawCollection.position.y = 0
		print($Pixelizer/SubViewport/MazeRegions/Puzzles/JigsawCollection.position.y)

func _on_puzzle_terminal_open_door():
	$Pixelizer/SubViewport/MazeRegions/EndCorridor/LargeHall2/EndDoor.open_door = true

func _on_end_passage_body_entered(_body):
	start_new_loop()
	$Screenfader/ScreenAnims.play("restart_loop")
	$Pixelizer/SubViewport/MazeRegions/EndCorridor/LargeHall2/EndDoor.close_door = true
