extends "res://Actors/Player/KingState.gd"

func get_transition(delta):
	match host().get_running_direction():
		"right", "left":
			return "run"
		_:
			return null

func enter_state(previous_state):
	host().animated_sprite.play("idle")
	host().velocity.x = 0
