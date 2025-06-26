extends Area3D

func _ready():
	$InteractSymbol.visible = false

func _on_area_entered(_area):
	$InteractSymbol.visible = true
func _on_area_exited(_area):
	$InteractSymbol.visible = false
