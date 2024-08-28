extends Node
class_name HpComponent

@export var MAX_HP := 100.0
var hp := 0.0

func _ready() -> void:
	hp = MAX_HP

func use_hp(count: float) -> void:
	hp -= count
	hp = clampf(hp, 0.0, MAX_HP)

func restore_hp(count: float) -> void:
	hp += count
	hp = clampf(hp, 0.0, MAX_HP)
