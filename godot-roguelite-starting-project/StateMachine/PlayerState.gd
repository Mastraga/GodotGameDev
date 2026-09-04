extends State
class_name PlayerState

@export var player : Player
@export var player_dash: PlayerState

func core_movement(delta : float, speed: float) -> void:
	var direction = player.get_movement_direction()
	player.velocity = direction * speed

func check_dash(event : InputEvent) -> void:
	if not player.can_dash():
		return
	if event.is_action_pressed("dash"):
		var direction := player.get_movement_direction()
		finished.emit(player_dash.name, {"direction" : direction})
