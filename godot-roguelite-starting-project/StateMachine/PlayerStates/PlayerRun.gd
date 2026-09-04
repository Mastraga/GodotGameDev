extends PlayerState

@export var player_fall: PlayerState


func physics_update(_delta: float) -> void:
	core_movement(_delta, player.movement_speed)
	if not player.is_on_floor():
		finished.emit(player_fall.name)
	player.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	check_dash(_event)
	
