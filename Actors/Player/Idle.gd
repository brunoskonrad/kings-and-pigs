extends "res://Scripts/State.gd"

func state_logic(delta):
	pass

func get_transition(delta):
	if host.get_input_direction():
		return "run"

func enter_state(old_state):
	host.animated_sprite.play("idle")
