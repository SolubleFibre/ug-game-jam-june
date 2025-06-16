extends Control

@export var pipe_textures: Array[Texture2D]
@export var pipe_orientation: int


func _ready():
	$pipe_image.texture = pipe_textures[pipe_orientation]


func _on_button_pressed():
	if pipe_textures.size()<1:
		push_error("Need more than zero textures.")

	else:
		pipe_orientation = (pipe_orientation + 1) % pipe_textures.size()
		$pipe_image.texture = pipe_textures[pipe_orientation]
		print(pipe_orientation)
