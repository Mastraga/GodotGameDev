extends CenterContainer

@export var inventory : Inventory

@onready var icon_container: GridContainer = %IconContainer
@onready var title_label: Label = $PanelContainer/VBoxContainer/TitleTexture/TitleLabel

var current_container : LootContainer

func _ready() -> void:
	visible = false
	
func open(loot: LootContainer) -> void:
	if visible:
		close()
	else:
		current_container = loot
		title_label.text = current_container.container_name
		for item in loot.get_items():
			current_container.remove_child(item)
			icon_container.add_child(item)
			item.visible = true
			item.interact.connect(pickup_item)
		visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
		
func close() -> void:
	visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if is_instance_valid(current_container):
		for item in icon_container.get_children():
			icon_container.remove_child(item)
			current_container.add_child(item)
			item.interact.disconnect(pickup_item)
			item.visible = false
	get_tree().paused = false

func pickup_item(icon: ItemIcon) -> void:
	icon.interact.disconnect(pickup_item)
	if icon is CurrencyIcon:
		inventory.add_currency(icon.value)
		icon.queue_free()
	else:
		inventory.add_item(icon)
