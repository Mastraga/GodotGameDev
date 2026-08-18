extends ItemIcon

@export var power: int
@export var item_model: PackedScene

func _ready() -> void:
	mod_label.text = "+%d" % power
	item_label.text = item_model.resource_path.get_file()
	var extension = item_model.resource_path.get_file().get_extension()
	item_label.text = item_label.text.rstrip("." + extension)
	item_label.text = item_label.text.capitalize()
