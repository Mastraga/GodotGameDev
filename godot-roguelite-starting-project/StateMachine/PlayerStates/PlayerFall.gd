extends PlayerState

@export var player_run: PlayerState

func physics_update(_delta: float) -> void:
	if player.is_on_floor():
		finished.emit(player_run.name)
	core_movement(_delta, player.movement_speed)
	player.velocity += player.get_gravity()
	player.move_and_slide()
