extends Node
class_name Spawn

var state_machine: StateMachine

export(String) var state_name

func state_logic(delta):
	pass
	
func get_transition(delta):
	return null
	
func enter_state(old_state):
	pass
	
func exit_state(new_state):
	pass
