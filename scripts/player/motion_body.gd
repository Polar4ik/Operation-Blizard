extends CharacterBody3D
class_name MotionBody

var target_vector := Vector2.ZERO

func _unhandled_key_input(_event: InputEvent) -> void:
	target_vector = Input.get_vector("left", "right", "forward", "down")

func _physics_process(_delta: float) -> void:
	move_and_slide()
