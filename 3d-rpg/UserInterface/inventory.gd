extends Control
class_name Inventory

@onready var level_label: Label = %LevelLabel
@onready var strength_label: Label = %StrengthLabel
@onready var agility_label: Label = %AgilityLabel
@onready var speed_label: Label = %SpeedLabel
@onready var endurance_label: Label = %EnduranceLabel
@onready var attack_value: Label = %AttackValue
@onready var item_grid: GridContainer = %ItemGrid
@onready var gold_label: Label = %GoldLabel

@onready var weapon_slot: CenterContainer = %WeaponSlot
@onready var shield_slot: CenterContainer = %ShieldSlot
@onready var armor_slot: CenterContainer = %ArmorSlot


@onready var player: Player = get_parent().player

@onready var gold := 0:
	set(value):
		gold = value
		gold_label.text = str(gold) + "g"

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
	var damage = 0
	if get_weapon():
		damage += get_weapon().power
	damage += player.stats.get_damage_modifier()
	return damage


func _on_back_button_pressed() -> void:
	get_parent().close_menu()

func add_item(icon: ItemIcon):
	for connection in icon.interact.get_connections():
		icon.interact.disconnect(connection.callable)
	var icon_parent = icon.get_parent()
	icon_parent.remove_child(icon)
	item_grid.add_child(icon)
	icon.interact.connect(interact)

func add_currency(currency_in: int):
	gold += currency_in
	
func equip_item(item : ItemIcon, item_slot : CenterContainer) -> void:
	for child in item_slot.get_children():
		add_item(child)
	item.get_parent().remove_child(item)
	item_slot.add_child(item)

func interact(item: ItemIcon) -> void:
	if item is WeaponIcon:
		equip_item(item, weapon_slot)
	update_gear_stats()

func get_weapon() -> WeaponIcon:
	if weapon_slot.get_child_count() != 1:
		return null
	return weapon_slot.get_child(0)
