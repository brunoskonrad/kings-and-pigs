extends Node
class_name StateMachine

signal state_changed

var state = null
var previous_state = null
var states_map = {}

export(NodePath) var host_path

onready var host = get_node(host_path) as Node2D

func _ready():
	for child in get_children():
		child.state_machine = self
		states_map[child.state_name] = child
	
	state = states_map[get_child(0).state_name]

func physics_process(delta):
	if state != null:
		state.state_logic(delta)
		var state_transition = state.get_transition(delta)
		var transition = _get_state(state_transition)
		
		if transition != null:
			set_state(transition)

func set_state(new_state):
	if new_state == state:
		return

	previous_state = state
	state = new_state
	
	if previous_state != null:
		previous_state.exit_state(new_state)
		
	if new_state != null:
		new_state.enter_state(previous_state)
		
	emit_signal("state_changed", new_state.state_name)

func _get_state(key):
	if key:
		return states_map[key]
	return null

func is_current_state(expected_state):
	if state != null:
		state.state_name == expected_state
	return false
