extends "res://Actors/Player/KingState.gd"

func state_logic(delta):
	var host = host()

	match host.get_input_direction():
		"right":
			host.direction = Vector2(1, 0)
			host.animated_sprite.set_flip_h(false)
		"left":
			host.direction = Vector2(-1, 0)
			host.animated_sprite.set_flip_h(true)
		_:
			host.direction = Vector2()

func get_transition(delta):
	if host().get_input_direction() == null:
		return "idle"

func enter_state(old_state):
	host().play_animation("run")
