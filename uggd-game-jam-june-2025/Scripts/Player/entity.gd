extends Node3D

@export var is_moving = false
@export var disappear_time : float = 0.5 ##Amount of time it takes for entity to disappear after being spotted (Note that, no matter what this value is, if the entity detects a light was shone on it and then removed, it will disppear immediately)
signal move

func _ready():
	$DisappearTimer.wait_time = disappear_time

func _process(_delta):
	if is_moving:
		$ShadowCaster.visible = false
		pass
	elif !is_moving:
		$ShadowCaster.visible = true

func disappear():
	move.emit()
	is_moving = true

func _on_light_detector_area_entered(_area):
	if !is_moving:
		$DisappearTimer.start()

func _on_light_detector_area_exited(_area):
	if !is_moving:
		disappear()

func _on_disappear_timer_timeout():
	disappear()
