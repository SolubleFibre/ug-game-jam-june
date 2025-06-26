extends Node

@export_range(5.0, 30.0, 1.0) var sounds_delay : float = 20.0

func _ready():
	$Timer.wait_time = sounds_delay

func _on_timer_timeout():
	var random_chance = randi_range(0,2)
	if random_chance == 0:
		$Sound1.play()
	elif random_chance == 1:
		$Sound2.play()
	elif random_chance == 2:
		$Sound3.play()
