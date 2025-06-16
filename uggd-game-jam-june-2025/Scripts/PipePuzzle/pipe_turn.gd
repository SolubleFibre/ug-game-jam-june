extends TextureRect

@export var rotated_sprites: Array[Texture2D] = []
@export var current_index :int 

func _ready():
	texture = rotated_sprites[current_index]

func _on_button_pressed():
	if rotated_sprites.size() > 0:
		current_index = (current_index + 1) % rotated_sprites.size()
		texture = rotated_sprites[current_index]
