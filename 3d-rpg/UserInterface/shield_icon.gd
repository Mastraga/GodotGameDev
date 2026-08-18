extends ItemIcon
class_name ShieldIcon

@export var protection : int
@export var item_mesh : PackedScene

func _ready() -> void:
	mod_label.text = "+%d" % protection
	item_label.text = item_mesh.resource_path.get_file()
	var extension = item_mesh.resource_path.get_file().get_extension()
	item_label.text = item_label.text.rstrip("." + extension)
	item_label.text = item_label.text.capitalize()
