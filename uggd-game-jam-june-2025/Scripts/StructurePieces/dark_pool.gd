@tool
extends Node3D

@export var current_state : int = 0
@export var keep_loaded = false
@onready var pool_state : Node = $Structure/VoidFluid/PoolStates
@export_category("Collection Parameters")
@export var item_1 : Node
@export var item_2 : Node
@export var item_3 : Node
@export var collected_items : int = 0
var played_animation = false
var display_completion_text = false
var displayed_completion_text = false

func _ready():
	if keep_loaded:
		$SectionLoader.keep_loaded = true
	$InputDetector/Hitbox.position.y = -100

func check_item_count():
	if collected_items == 3:
		$PoolSound.play()
		$PoolSound.pitch_scale = 1

func _process(_delta):
	if current_state == 0:
		pool_state.play("calm")
		$InputDetector/Hitbox.position.y = -100
		$PoolSound.stop()
	elif current_state == 1:
		pool_state.play("agitated")
		$InputDetector/Hitbox.position.y = 0
	elif current_state == 2:
		pool_state.play("symbol")
		$InputDetector/Hitbox.position.y = -100
		$PoolSound.pitch_scale = 2
	
	if !displayed_completion_text and collected_items == 3:
		displayed_completion_text = true
		Settings.subtext_contents = "FEED THE ABYSS."
		Settings.show_subtext = true
	
	if item_1:
		if item_1.collected:
			item_1.queue_free()
			collected_items += 1
			$ItemPickup.play()
			check_item_count()
	if item_2:
		if item_2.collected:
			item_2.queue_free()
			collected_items += 1
			$ItemPickup.play()
			check_item_count()
	if item_3:
		if item_3.collected:
			item_3.queue_free()
			collected_items += 1
			$ItemPickup.play()
			check_item_count()

func _on_pool_sound_finished():
	$PoolSound.play()

func _on_input_detector_open_ui():
	if collected_items == 3 and !played_animation:
		current_state = 2
		$Structure/VoidFluid/Symbol/SymbolAnimation.play("rise")
		$PoolSound.play()
		$PoolSound.pitch_scale = 2
		PuzzleManager.exterior_puzzle_complete = true
		played_animation = true
	if collected_items < 3:
		Settings.subtext_contents = "MORE TEARS NEEDED."
		Settings.show_subtext = true
