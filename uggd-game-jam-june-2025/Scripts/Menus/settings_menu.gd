extends Control

@export var toggle_state = false
@export var open = false

func _process(_delta):
	if toggle_state:
		toggle_state = false
		toggle_current_state()

func _on_open_button_pressed():
	toggle_current_state()
	$ButtonPress.play()

func toggle_current_state():
	if !open:
		open = true
		$OpenButton/ButtonAnims.play("turn")
	elif open:
		open = false
		$OpenButton/ButtonAnims.play_backwards("turn")
