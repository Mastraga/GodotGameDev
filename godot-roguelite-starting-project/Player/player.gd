extends CharacterBody3D
class_name Player

@export var movement_speed : float = 8.0
@export var dash_speed : float = 24.0

@onready var dash_cooldown: Timer = $DashCooldown

func get_movement_direction() -> Vector3:
	var camera = get_viewport().get_camera_3d()
	var camera_rotation = camera.global_rotation.y
	var input = Vector3.ZERO
	var input_vector := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	input = Vector3(input_vector.x, 0.0, input_vector.y)
	input = input.rotated(Vector3.UP, camera_rotation)
	return input.normalized()

func can_dash() -> bool:
	if get_movement_direction().is_zero_approx():
		return false
	return dash_cooldown.is_stopped()
