extends "res://Actors/Player/KingState.gd"

func state_logic(delta):
	match host().get_running_direction():
		"right":
			run_to_right()
		"left":
			run_to_left()
		_:
			halt()

func enter_state(previous_state):
	host().animated_sprite.play("run")

func get_transition(delta):
	if !host().get_running_direction():
		return "idle"

func run_to_right():
	host().velocity.x = running_speed()
	host().face_right()

func run_to_left():
	host().velocity.x = -running_speed()
	host().face_left()

func halt():
	host().velocity.x = 0

func running_speed():
	return host().speed
