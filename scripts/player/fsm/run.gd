extends State
class_name MoveableState

var motion_body: MotionBody
var head: Marker3D

@export var speed := 5.0
@export var accel := 0.2

func physics_update(_delta: float) -> void:
	motion_body = host as MotionBody
	head = motion_body.get_node("Head")
	
	if !motion_body.target_vector:
		change_state.emit("Idle")
	
	if !motion_body.is_on_floor():
		change_state.emit("Fall")
	
	move()

func move() -> void:
	var dir = Basis(motion_body.transform.basis.x, motion_body.transform.basis.y, motion_body.transform.basis.z) * Vector3(motion_body.target_vector.x, 0, motion_body.target_vector.y).normalized()
	
	if dir:
		motion_body.velocity = lerp(motion_body.velocity, dir * speed, accel)
