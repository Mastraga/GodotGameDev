extends ShapeCast3D

@export var ui : Control
@export var player : Player
func check_interactions() -> void:
	for collision in get_collision_count():
		var collider = get_collider(collision)
		if collider is LootContainer:
			var loot : Array
			ui.update_interact_text("Open Chest")
			if Input.is_action_just_pressed("interact"):
				ui.open_loot_container(collider)
		
		if collider is Passage:
			ui.update_interact_text("Pass Through")
			if Input.is_action_just_pressed("interact"):
				collider.travel(player)
