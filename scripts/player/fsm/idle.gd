extends State

var motion_body: MotionBody
@export var deaccel := 0.3

func physics_update(_delta: float) -> void:
	motion_body = host as MotionBody
	
	if motion_body.target_vector:
		change_state.emit("Run")
	
	if !motion_body.is_on_floor():
		change_state.emit("Fall")
	
	stop()

func stop() -> void:
	if motion_body.velocity:
		motion_body.velocity = lerp(motion_body.velocity, Vector3.ZERO, deaccel)
