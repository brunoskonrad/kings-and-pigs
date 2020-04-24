extends "res://Actors/Player/KingState.gd"

var current_time = 0
var released = false

func state_logic(delta):
	current_time += delta

	if _should_increase_jump():
		host().velocity.y -= 350 * current_time

	if Input.is_action_just_released("jump"):
		print("Release ", current_time)
		released = true
	
func get_transition(delta):
	if host().is_falling():
		return "fall"
	if host().is_on_floor():
		return "idle"

func enter_state(previous_state):
	_reset()
	
	host().velocity.y = -400
	
func exit_state(x):
	print("Exit ", current_time)
	
func _reset():
	current_time = 0
	released = false

func _should_increase_jump():
	return (
		Input.is_action_pressed("jump") and
		#current_time >= 0.09 and
		current_time <= 0.19 and
		not released
	)
