extends State
class_name PlayerState

@export var player : Player

func core_movement(delta : float, speed: float) -> void:
	var direction = player.get_movement_direction()
	player.velocity = direction * speed
