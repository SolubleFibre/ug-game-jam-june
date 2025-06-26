@tool
extends Node3D

@export var current_state : int = 0
@export var keep_loaded = false
@onready var pool_state : Node = $Structure/VoidFluid/PoolStates
@export_category("Collection Parameters")
@export var item_1 : Node
@export var item_2 : Node
@export var item_3 : Node
@export var collected = 0
var played_animation = false
var display_completion_text = false

func _ready():
	if keep_loaded:
		$SectionLoader.keep_loaded = true
	$InputDetector/Hitbox.position.y = -100

func _process(_delta):
	if current_state == 0:
		pool_state.play("calm")
		$InputDetector/Hitbox.position.y = -100
	elif current_state == 1:
		pool_state.play("agitated")
		$InputDetector/Hitbox.position.y = 0
	elif current_state == 2:
		pool_state.play("symbol")
		$InputDetector/Hitbox.position.y = -100

func _on_pool_sound_finished():
	$PoolSound.play()

func _on_input_detector_open_ui():
	if collected == 3 and !played_animation:
		current_state = 2
		$Structure/VoidFluid/Symbol/SymbolAnimation.play("rise")
		PuzzleManager.exterior_puzzle_complete = true
		played_animation = true
