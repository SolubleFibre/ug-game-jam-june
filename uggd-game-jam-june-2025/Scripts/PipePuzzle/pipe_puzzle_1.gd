extends Control

## This determines the correct answer to the puzzle 
var puzzle_answer: Array[int]= [
	1, 2, 2,
	1, 3, 0,
	0, 1, 3,
]


## Player Guess corectness display
## displays whether the player's answer they submitted is correct or wrong
@export var puzzle_guess_checker_display: Array[Texture2D]

signal disable_screen

## Load in the changes the player made to their pipes
func _on_submit_button_pressed():
	# load the current state of the player's tiles.
	var pipe_0_0: int = $tile_0_0.pipe_orientation 
	var pipe_0_1: int = $tile_0_1.pipe_orientation 
	var pipe_0_2: int = $tile_0_2.pipe_orientation 

	var pipe_1_0: int = $tile_1_0.pipe_orientation 
	var pipe_1_1: int = $tile_1_1.pipe_orientation 
	var pipe_1_2: int = $tile_1_2.pipe_orientation 

	var pipe_2_0: int = $tile_2_0.pipe_orientation 
	var pipe_2_1: int = $tile_2_1.pipe_orientation 
	var pipe_2_2: int = $tile_2_2.pipe_orientation 

	var player_answer: Array[int] = [
		pipe_0_0, pipe_0_1, pipe_0_2,
		pipe_1_0, pipe_1_1, pipe_1_2,
		pipe_2_0, pipe_2_1, pipe_2_2,
	]

	if puzzle_answer == player_answer:
		#play correct sfx
		$SubmissionDisplay.texture = puzzle_guess_checker_display[1]
		disable_screen.emit()

	
	else:
		#play wrong sfx
		$SubmissionDisplay.texture = puzzle_guess_checker_display[0]
