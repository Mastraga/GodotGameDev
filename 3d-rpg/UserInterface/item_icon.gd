extends TextureButton
class_name ItemIcon

signal interact(item)

@onready var mod_label: Label = $MarginContainer/ModLabel
@onready var item_label: Label = $MarginContainer/ItemLabel



func _on_gui_input(event: InputEvent) -> void:
	if event.is_action("click"):
		interact.emit(self)
