extends PlayerState


@export var player_run : State
@onready var dash_duration: Timer = $DashDuration
var direction : Vector3

func enter(_previous_state_path: String, _data := {}) -> void:
	direction = _data["direction"]
	player.velocity = direction * player.dash_speed
	player.dash_cooldown.start()
	dash_duration.start()


func physics_update(_delta: float) -> void:
	if dash_duration.is_stopped():
		finished.emit(player_run.name)
	player.move_and_slide()
