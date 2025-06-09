@tool
extends Node3D

@export var entity : Node ##Choose which node is to be randomly moved
@export var move_delay : float ## Amount of time that passes until the entity is made visible again
@export var move_now = false ##Don't mess with this option unless you want the entity to randomly move immediately upon startup
@export_group("Spawning Range")
@export var range_x : float ##How far the selected entity can spawn to either side of this node's center (E.g. if this value is set to 4, then it can spawn anywhere within 4 meters to the left or 4 meters to the right)
@export var range_z : float ##How far the selected entity can spawn either before or behind this node's center (E.g. if this value is set to 4, then it can spawn anywhere within 4 meters forward or 4 meters back)
var timer_running = false

func _ready():
	if move_delay:
		$MovementDelay.wait_time = move_delay

func _process(_delta):
	var random_x = randf_range(-range_x,range_x)
	var random_z = randf_range(-range_z,range_z)
	
	$RangeShower.shape.size.x = range_x * 2
	$RangeShower.shape.size.z = range_z * 2
	
	if entity and entity.is_moving and !timer_running:
		timer_running = true
		$MovementDelay.start()
	
	if move_now and entity:
		move_now = false
		entity.position.x = position.x + random_x
		entity.position.z = position.z + random_z

func _on_movement_delay_timeout():
	move_now = true
	timer_running = false
	entity.is_moving = false
