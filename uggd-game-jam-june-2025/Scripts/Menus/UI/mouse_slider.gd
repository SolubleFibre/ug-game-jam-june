extends HSlider

func _ready():
	value = Settings.mouse_sensitivity

func _process(_delta):
	Settings.mouse_sensitivity = value
	$Label.text = str(Settings.mouse_sensitivity)
	if Settings.mouse_sensitivity == 700:
		$Label.text = "Default"
	elif Settings.mouse_sensitivity > 700:
		$Label.text = "Lower Sensitivity"
	elif Settings.mouse_sensitivity < 700:
		$Label.text = "Higher Sensitivity"
	elif Settings.mouse_sensitivity < 200:
		$Label.text = "Extremely High Sensitivity"
	elif Settings.mouse_sensitivity >1700:
		$Label.text = "Extremely Low Sensitivity"
