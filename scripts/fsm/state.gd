extends Node
class_name State

@warning_ignore("unused_signal")
signal change_state(state_name: String)

@onready var host := owner

func enter() -> void:
	return

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func unhandled_key_input(_event: InputEvent) -> void:
	pass
