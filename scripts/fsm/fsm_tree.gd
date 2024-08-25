extends State
class_name FSMTree

var current_state: State

@export var init_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			child.change_state.connect(set_new_state)
	
	current_state = init_state
	current_state.enter()

# if it is the root then this called
func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)

func _process(delta: float) -> void:
	current_state.update(delta)

# if not then this called
func physics_update(delta: float) -> void:
	current_state.physics_update(delta)

func update(delta: float) -> void:
	current_state.update(delta)

# change state
func set_new_state(new_state_name: String) -> void:
	var new_state: State = get_node_or_null(new_state_name)
	if !is_instance_valid(new_state):
		#oh no...
		if new_state_name:
			push_error("Error changing to ", new_state_name, " in ", host.name, " switched to ", init_state.name)
		
		set_new_state(init_state.name)
		return
	
	if new_state == current_state:
		return
	
	set_state(new_state)

func set_state(new_state: State) -> void:
	current_state.exit()
	current_state = new_state
	current_state.enter()
