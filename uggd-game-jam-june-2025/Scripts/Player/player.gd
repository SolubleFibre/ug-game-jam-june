extends CharacterBody3D

@export var SPEED = 5
var sprinting_speed : float = 1

func _ready():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_CAPTURED)
	$VisibleMesh.visible = false
	
func _unhandled_input(_event):
	if Input.is_action_just_pressed("sprint"):
		sprinting_speed = 1.5
		$Camera/FovAnims.play("sprint")
	elif Input.is_action_just_released("sprint"):
		sprinting_speed = 1
		$Camera/FovAnims.play_backwards("sprint")

func _process(_delta):
	var random_pitch = randf_range(0.8,1.2)
	$CameraAnims/Footsteps.pitch_scale = random_pitch

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction and Settings.player_can_move:
		$CameraAnims.play("view_bob")
		$FlashlightAnims.play("bob")
		velocity.x = direction.x * SPEED * sprinting_speed
		velocity.z = direction.z * SPEED * sprinting_speed
	else:
		$CameraAnims.stop()
		$FlashlightAnims.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED * sprinting_speed)
		velocity.z = move_toward(velocity.z, 0, SPEED * sprinting_speed)

	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion and Settings.player_can_move:
		rotation.y -= event.relative.x / Settings.mouse_sensitivity
		$Camera.rotation.x -= event.relative.y / Settings.mouse_sensitivity
		$Camera.rotation.x = clamp($Camera.rotation.x, deg_to_rad(-65), deg_to_rad(90))
