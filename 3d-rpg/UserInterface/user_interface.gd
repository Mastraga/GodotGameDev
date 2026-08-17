extends Control

@export var player: Player

@onready var level_label: Label = %LevelLabel
@onready var health_bar: TextureProgressBar = %HealthBar
@onready var xp_bar: TextureProgressBar = %XpBar
@onready var health_label: Label = %HealthLabel
@onready var inventory: Control = $Inventory

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("open_menu"):
		if inventory.visible:
			close_menu()
		else:
			open_menu()

func update_stats_display():
	level_label.text = str(player.stats.level)
	xp_bar.max_value = player.stats.percentage_level_upgrade_boundary()
	xp_bar.value = player.stats.xp

func update_health() -> void:
	health_bar.max_value = player.stats.get_max_health()
	health_bar.value = player.health_component.current_health
	health_label.text = player.health_component.get_health_string()
	
func open_menu() -> void:
	inventory.visible = true
	get_tree().paused = true
	inventory.update_stats()
	inventory.update_gear_stats()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func close_menu() -> void:
	inventory.visible = false
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
