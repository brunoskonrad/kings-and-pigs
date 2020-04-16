extends "res://Actors/Player/KingState.gd"

func state_logic(delta):
	var host = host()
	var direction = host.get_input_direction();

	host.run(direction)

func get_transition(delta):
	if host().get_input_direction() == null:
		return "idle"

func enter_state(old_state):
	host().play_animation("run")
