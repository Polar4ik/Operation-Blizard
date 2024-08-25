extends State

var motion_body: MotionBody
var head: Marker3D

func physics_update(_delta: float) -> void:
	motion_body = host as MotionBody
	head = motion_body.get_node("Head")
	
	move()

func update(_delta: float) -> void:
	if !motion_body.target_vector:
		change_state.emit("Idle")

func move() -> void:
	var dir = Basis(motion_body.transform.basis.x, motion_body.transform.basis.y, motion_body.transform.basis.z) * Vector3(motion_body.target_vector.x, 0, motion_body.target_vector.y).normalized()
	motion_body.velocity = dir * 5
