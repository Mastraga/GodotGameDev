extends Resource
class_name CharacterStats

class Ability:
	var min_modifier : float
	var max_modifier : float
	
	var ability_score : int = 25:
		set(value):
			ability_score = clampi(value, 0, 100)

	func _init(min: float, max: float) -> void:
		min_modifier = min
		max_modifier = max
	
	func percentile_lerp(min_bound : float, max_bound : float) -> float:
		return lerp(min_bound, max_bound, ability_score/100.0)
		
	func get_modifier() -> float:
		return percentile_lerp(min_modifier, max_modifier)
	
	func increase() -> void:
		ability_score += randi_range(2, 5)

var level := 1
var xp := 0:
	set(value):
		xp = value
		var boundary = percentage_level_upgrade_boundary()
		while xp > boundary:
			level_up()
			xp -= boundary
			boundary = percentage_level_upgrade_boundary()

# Damage Bonus on attack.
var strength := Ability.new(2.0, 12.0)
# Movement speed in m/s
var speed := Ability.new(3.0, 7.0)
# Added health per level
var endurance := Ability.new(5.0, 25.0)
# Critical hit chance
var agility := Ability.new(0.05, 0.25)

func get_base_speed() -> float:
	return speed.get_modifier()

func get_damage_modifier() -> float:
	return strength.get_modifier()

func get_crit_chance() -> float:
	return agility.get_modifier()

func level_up() -> void:
	level += 1
	strength.increase()
	agility.increase()
	speed.increase()
	endurance.increase()
	#printt(strength.ability_score,
	#agility.ability_score,
	#speed.ability_score,
	#endurance.ability_score)
	#print("You've reached level ", level)

func percentage_level_upgrade_boundary() -> int:
	return int(50 * pow(1.2, level))
