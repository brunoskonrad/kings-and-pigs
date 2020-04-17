extends "res://Actors/Player/KingState.gd"

var attack_finished = false

func get_transition(delta):
	if attack_finished:
		return "idle"

func enter_state(previous_state):
	attack_finished = false
	var host = host()
	
	host.animated_sprite.play("attack")
	
	if host.is_on_floor():
		host.velocity.x = 0
	
func exit_state(next_state):
	attack_finished = false

func _on_AnimatedSprite_animation_finished():
	attack_finished = true
