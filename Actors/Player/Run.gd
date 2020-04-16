extends "res://Actors/Player/KingState.gd"

func state_logic(delta):
	match host().get_input_direction():
		"right":
			run_to_right()
		"left":
			run_to_left()
		_:
			halt()

func enter_state(previous_state):
	host().animated_sprite.play("run")

func get_transition(delta):
	if host().get_input_direction() == null:
		return "idle"

func run_to_right():
	host().direction = Vector2(1, 0)
	host().animated_sprite.set_flip_h(false)

func run_to_left():
	host().direction = Vector2(-1, 0)
	host().animated_sprite.set_flip_h(true)

func halt():
	host().direction = Vector2(0, 0)
