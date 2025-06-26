extends Label

func _process(_delta):
	if Settings.show_subtext:
		Settings.show_subtext = false
		text = Settings.subtext_contents
		$DisplayText.play("appearance")
