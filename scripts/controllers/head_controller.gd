extends Marker3D

var sensity := 0.1

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(e: InputEvent) -> void:
	if e is InputEventMouseMotion:
		rotation_degrees.y += -e.relative.x * sensity
		
		rotation_degrees.x += -e.relative.y * sensity
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)
