@tool
extends Node3D

@export var current_state : int = 0
@export var keep_loaded = false
@onready var pool_state = $Structure/VoidFluid/PoolStates

func _ready():
	if keep_loaded:
		$SectionLoader.keep_loaded = true

func _process(_delta):
	if current_state == 0:
		pool_state.play("calm")
	elif current_state == 1:
		pool_state.play("agitated")
	elif current_state == 2:
		pool_state.play("symbol")
