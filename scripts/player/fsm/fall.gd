extends State

var gravity := 9.8

var motion_body: MotionBody

func physics_update(_delta: float) -> void:
	motion_body = host as MotionBody
	
	if motion_body.is_on_floor():
		change_state.emit("Idle")
	
	gravitation()

func gravitation() -> void:
	if !motion_body.is_on_floor():
		motion_body.velocity.y = -gravity
