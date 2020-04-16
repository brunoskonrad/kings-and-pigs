extends "res://Scripts/State.gd"

func state_logic(delta):
	match(host.get_input_direction()):
		"right":
			host.animated_sprite.set_flip_h(false);
			host.position += Vector2(3, 0)
		"left":
			host.animated_sprite.set_flip_h(true);
			host.position -= Vector2(3, 0)

func get_transition(delta):
	if host.get_input_direction() == null:
		return "idle"

func enter_state(old_state):
	host.animated_sprite.play("run")
