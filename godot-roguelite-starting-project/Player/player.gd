extends CharacterBody3D
class_name Player

@onready var camera_3d: Camera3D = $CameraRoot/Camera3D

func get_movement_direction() -> Vector3:
	var camera = get_viewport().get_camera_3d()
	var camera_rotation = camera.global_rotation.y
	var input = Vector3.ZERO
	var input_vector := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	input = Vector3(input_vector.x, 0.0, input_vector.y)
	input = input.rotated(Vector3.UP, camera_rotation)
	return input.normalized()
