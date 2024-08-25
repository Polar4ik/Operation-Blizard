extends Node
class_name StaminaComponent

@export var MAX_STAMINA := 100.0
var stamina := 0.0

func _ready() -> void:
	stamina = MAX_STAMINA

func use_stamina(count: float) -> void:
	stamina -= count
	stamina = clampf(stamina, 0.0, MAX_STAMINA)

func restore_stamina(count: float) -> void:
	stamina += count
	stamina = clampf(stamina, 0.0, MAX_STAMINA)
