extends "res://Actors/Player/KingState.gd"

func get_transition(delta):
	if host().get_input_direction():
		return "run"

func enter_state(old_state):
	host().play_animation("idle")
