extends Node3D

@export var player : Player

@onready var timer: Timer = $Timer
@onready var dashcloud: GPUParticles3D = $Dashcloud

var direction : Vector3 = Vector3.ZERO
var dash_multiplier := 3.5
var dash_duration := 0.1
var time_remaining := 0.0


func _unhandled_input(event: InputEvent) -> void:
	if not timer.is_stopped():
		return
	if not player.is_physics_processing():
		return
	if not player.rig.is_idle():
		return
	if event.is_action_pressed("dash"):
		direction = player.get_movement_direction()
		
		if not direction.is_zero_approx():
			player.rig.travel("Dash")
			timer.start(1.0)
			dashcloud.emitting = true
			time_remaining = dash_duration

func _physics_process(delta: float) -> void:
	if direction.is_zero_approx():
		return
	player.velocity = direction * player.stats.get_base_speed() * dash_multiplier
	time_remaining -= delta
	if time_remaining <= 0:
		dashcloud.emitting = false
		direction = Vector3.ZERO
