extends Control

@export var player: Player

@onready var level_label: Label = %LevelLabel
@onready var health_bar: TextureProgressBar = %HealthBar
@onready var xp_bar: TextureProgressBar = %XpBar
@onready var health_label: Label = %HealthLabel
@onready var inventory: Control = $Inventory
@onready var restart_label: Label = $HUD/VBoxContainer/RestartLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interact_text: Label = %InteractText
@onready var loot_container: CenterContainer = $LootContainer

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


func _on_health_component_defeat() -> void:
	restart_label.visible = true

func update_interact_text(text: String) -> void:
	animation_player.stop()
	animation_player.play("FadeOutText")
	interact_text.text = text

func open_loot_container() -> void:
	loot_container.open()
