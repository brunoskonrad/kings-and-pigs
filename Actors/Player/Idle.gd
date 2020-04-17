extends "res://Actors/Player/KingState.gd"

func get_transition(delta):
	match host().get_input_direction():
		"right", "left":
			return "run"
		"jump":
			if host().can_jump():
				return "jump"
		_:
			return null

func enter_state(previous_state):
	host().animated_sprite.play("idle")
