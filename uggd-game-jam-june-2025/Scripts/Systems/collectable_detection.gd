extends Area3D

var collected = false

func _on_body_entered(_body):
	if !collected:
		PuzzleManager.collected += 1
		collected = true
		$CollectSFX.play()

func _on_collect_sfx_finished():
	queue_free()
