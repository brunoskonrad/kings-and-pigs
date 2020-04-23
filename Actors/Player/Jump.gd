extends "res://Actors/Player/KingState.gd"

func get_transition(delta):
	if host().is_falling():
		return "fall"
	if host().is_on_floor():
		return "idle"

func enter_state(previous_state):
	var host = host()
	
	host.velocity.y = -host.jump_strength
