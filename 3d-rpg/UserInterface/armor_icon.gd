extends ItemIcon
class_name ArmorIcon
@export var protection : float
@export var armor: armor_type

enum armor_type {
	IRON_PLATE,
	STEEL_PLATE,
	AEGIS_PLATE
}
func _ready() -> void:
	mod_label.text = "+%d" % protection
	var item_string = armor_type.keys()[armor]
	item_label.text = item_string.capitalize()
	
