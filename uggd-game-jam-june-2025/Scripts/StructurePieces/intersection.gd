@tool
extends Node3D

@export var state = 0 ##0 = All paths open, 1 = 3 paths open, 2 = corridor with 2 dead ends, 3 = dead end, 4 = corner

func _process(_delta):
	if state == 0:
		$Structure/CorridorEnds/Wall1.position.y = 300
		$Structure/CorridorEnds/Wall2.position.y = 300
		$Structure/CorridorEnds/Wall3.position.y = 300
		$Structure/CorridorEnds/Wall4.position.y = 300
	elif state == 1:
		$Structure/CorridorEnds/Wall1.position.y = 0
		$Structure/CorridorEnds/Wall2.position.y = 300
		$Structure/CorridorEnds/Wall3.position.y = 300
		$Structure/CorridorEnds/Wall4.position.y = 300
	elif state == 2:
		$Structure/CorridorEnds/Wall1.position.y = 0
		$Structure/CorridorEnds/Wall2.position.y = 0
		$Structure/CorridorEnds/Wall3.position.y = 300
		$Structure/CorridorEnds/Wall4.position.y = 300
	elif state == 3:
		$Structure/CorridorEnds/Wall1.position.y = 0
		$Structure/CorridorEnds/Wall2.position.y = 0
		$Structure/CorridorEnds/Wall3.position.y = 0
		$Structure/CorridorEnds/Wall4.position.y = 300
	elif state == 4:
		$Structure/CorridorEnds/Wall1.position.y = 0
		$Structure/CorridorEnds/Wall2.position.y = 300
		$Structure/CorridorEnds/Wall3.position.y = 0
		$Structure/CorridorEnds/Wall4.position.y = 300
