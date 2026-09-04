extends PlayerState

@export var player_fall: PlayerState


func physics_update(_delta: float) -> void:
	core_movement(_delta, 8.0)
	if not player.is_on_floor():
		finished.emit(player_fall.name)
	player.move_and_slide()
