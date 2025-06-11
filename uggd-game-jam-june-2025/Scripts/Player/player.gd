extends CharacterBody3D

@export var SPEED = 5
const JUMP_VELOCITY = 4.5

func _ready():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_CAPTURED)
	$VisibleMesh.visible = false

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		$CameraAnims.play("view_bob")
		$FlashlightAnims.play("bob")
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		$CameraAnims.stop()
		$FlashlightAnims.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x / 700
		$Camera.rotation.x -= event.relative.y / 700
		$Camera.rotation.x = clamp($Camera.rotation.x, deg_to_rad(-65), deg_to_rad(90))
