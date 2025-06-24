extends Area3D

var collected = false

func _on_body_entered(_body):
	if !collected:
		PuzzleManager.collected += 1
		collected = true
		$Disappear.play("vanish")

func _on_disappear_animation_finished(_anim_name):
	queue_free()

func _on_collect_sfx_finished():
	queue_free()
