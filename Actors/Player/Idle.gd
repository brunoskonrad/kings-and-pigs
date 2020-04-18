extends "res://Actors/Player/KingState.gd"

func get_transition(delta):
	match host().get_running_direction():
		"right", "left":
			return "run"
		_:
			return null

func enter_state(previous_state):
	host().velocity.x = 0
