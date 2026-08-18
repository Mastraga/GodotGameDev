extends ItemIcon
class_name CurrencyIcon

@export var value : int

func _ready() -> void:
	mod_label.text = "+%d" % value
