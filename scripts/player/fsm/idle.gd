extends State

func update(_delta: float) -> void:
	var motion_body = host as MotionBody
	
	if motion_body.target_vector:
		change_state.emit("Run")
