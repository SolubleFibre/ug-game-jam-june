@tool
extends Node3D

@export var state = 0 ## 0 = All paths open, 1 = 3 paths open, 2 = corridor with 2 dead ends, 3 = dead end, 4 = corner

func _process(_delta):
	if state == 0:
		$CorridorEnds/Wall1.position.y = 300
		$CorridorEnds/Wall2.position.y = 300
		$CorridorEnds/Wall3.position.y = 300
		$CorridorEnds/Wall4.position.y = 300
	elif state == 1:
		$CorridorEnds/Wall1.position.y = 0
		$CorridorEnds/Wall2.position.y = 300
		$CorridorEnds/Wall3.position.y = 300
		$CorridorEnds/Wall4.position.y = 300
	elif state == 2:
		$CorridorEnds/Wall1.position.y = 0
		$CorridorEnds/Wall2.position.y = 0
		$CorridorEnds/Wall3.position.y = 300
		$CorridorEnds/Wall4.position.y = 300
	elif state == 3:
		$CorridorEnds/Wall1.position.y = 0
		$CorridorEnds/Wall2.position.y = 0
		$CorridorEnds/Wall3.position.y = 0
		$CorridorEnds/Wall4.position.y = 300
	elif state == 4:
		$CorridorEnds/Wall1.position.y = 0
		$CorridorEnds/Wall2.position.y = 300
		$CorridorEnds/Wall3.position.y = 0
		$CorridorEnds/Wall4.position.y = 300
