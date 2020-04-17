extends "res://Actors/Player/KingState.gd"

func get_transition(delta):
	if host().is_on_floor():
		return "idle"

func enter_state(previous_state):
	host().animated_sprite.play("fall")
