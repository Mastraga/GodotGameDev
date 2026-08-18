extends ItemIcon

@export var power : int
@export var armor: armor_type

enum armor_type {
	IRON_PLATE,
	STEEL_PLATE,
	AEGIS_PLATE
}
func _ready() -> void:
	mod_label.text = "+%d" % power
	var item_string = armor_type.keys()[armor]
	item_label.text = item_string.capitalize()
	
