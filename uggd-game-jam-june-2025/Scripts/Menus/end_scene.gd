extends Node

func _on_sign_end_scene():
	$Pixelizer/SubViewport/Environment/Sign/Timer.start()

func _on_end_anims_animation_finished(anim_name):
	if anim_name == "End.":
		get_tree().change_scene_to_file("res://Scenes/Menus/ending_credits.tscn")

func _on_timer_timeout():
	$EndAnims.play("End.")
	Settings.player_can_move = false
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
