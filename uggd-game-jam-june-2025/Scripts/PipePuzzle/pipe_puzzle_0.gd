extends Control

#puzzle answer
var puzzle_answer: Array[int]= [
	1, 2, 2,
	1, 3, 0,
	0, 1, 3,
]


## Load in the changes the player made to their pipes
func _on_submit_button_pressed():
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
		print("Puzzle answer matches wiht player answer")
	
	else:
		print("no match.")
		print("Puzzle answer: ",puzzle_answer)
		print("Player answer: ", player_answer)
