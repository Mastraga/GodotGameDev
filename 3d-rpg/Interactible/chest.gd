extends StaticBody3D
class_name LootContainer

@export var container_name : String

func get_items() -> Array:
	return get_children().filter(
		func(child): return child is ItemIcon
	)
