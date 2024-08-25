extends State

var motion_body: MotionBody
@export var deaccel := 0.3

func update(_delta: float) -> void:
	if motion_body.target_vector:
		change_state.emit("Run")

func physics_update(_delta: float) -> void:
	motion_body = host as MotionBody
	stop()

func stop() -> void:
	if motion_body.velocity:
		motion_body.velocity = lerp(motion_body.velocity, Vector3.ZERO, deaccel)
