extends Control
class_name Inventory

@onready var level_label: Label = %LevelLabel
@onready var strength_label: Label = %StrengthLabel
@onready var agility_label: Label = %AgilityLabel
@onready var speed_label: Label = %SpeedLabel
@onready var endurance_label: Label = %EnduranceLabel
@onready var attack_value: Label = %AttackValue
@onready var item_grid: GridContainer = %ItemGrid

@onready var player: Player = get_parent().player

func _ready() -> void:
	update_stats()

func update_stats() -> void:
	level_label.text = "Level %d" % [player.stats.level]
	strength_label.text = str(player.stats.strength.ability_score)
	agility_label.text = str(player.stats.agility.ability_score)
	speed_label.text = str(player.stats.speed.ability_score)
	endurance_label.text = str(player.stats.endurance.ability_score)

func update_gear_stats() -> void:
	attack_value.text = str(get_weapon_value())

func get_weapon_value() -> int:
	var damage = 10 
	damage += player.stats.get_damage_modifier()
	return damage


func _on_back_button_pressed() -> void:
	get_parent().close_menu()

func add_item(icon: ItemIcon):
	var icon_parent = icon.get_parent()
	icon_parent.remove_child(icon)
	item_grid.add_child(icon)
