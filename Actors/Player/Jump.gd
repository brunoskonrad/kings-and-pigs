extends "res://Actors/Player/KingState.gd"

var jumped: bool = false

func get_transition(delta):
	if host().is_on_floor():
		return "idle"

func enter_state(previous_state):
	var host = host()
	
	host.velocity.y = -550
	host.animated_sprite.play("jump")
