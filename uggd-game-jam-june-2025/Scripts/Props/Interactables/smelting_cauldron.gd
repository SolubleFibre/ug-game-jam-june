extends Node3D

@export var ingot_1 : Node
@export var ingot_2 : Node
@export var ingot_3 : Node
@export var collected_ingots : int = 0
var played_animation = false
var can_be_filled = false
var display_completion_text = false

func _process(_delta):
	if collected_ingots == 0:
		$Caudron/MoltenMetal.position.y = -0.555
	elif collected_ingots == 1:
		$Caudron/MoltenMetal.position.y = -0.343
	elif collected_ingots == 2:
		$Caudron/MoltenMetal.position.y = -0.166
	elif collected_ingots == 3:
		$Caudron/MoltenMetal.position.y = 0.093
		if !can_be_filled:
			can_be_filled = true
			if !display_completion_text:
				display_completion_text = true
				Settings.subtext_contents = "THERE IS ENOUGH METAL"
				Settings.show_subtext = true
	
	if ingot_1:
		if ingot_1.collected:
			ingot_1.queue_free()
			collected_ingots += 1
			$ItemPickup.play()
	if ingot_2:
		if ingot_2.collected:
			ingot_2.queue_free()
			collected_ingots += 1
			$ItemPickup.play()
	if ingot_3:
		if ingot_3.collected:
			ingot_3.queue_free()
			collected_ingots += 1
			$ItemPickup.play()

func _on_input_detector_open_ui():
	if !can_be_filled:
		Settings.subtext_contents = "NOT ENOUGH METAL."
		Settings.show_subtext = true
	elif can_be_filled and !played_animation:
		played_animation = true
		$Caudron/CauldronAnims.play("End")

func _on_cauldron_anims_animation_finished(_anim_name):
	PuzzleManager.exterior_puzzle_complete = true
