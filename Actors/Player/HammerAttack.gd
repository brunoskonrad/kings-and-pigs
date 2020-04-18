extends Node2D

signal start_hammer_attack
signal hammer_attack_animation_finished

onready var scale_x = scale.x

func _input(event):
	if event.is_action_pressed("attack"):
		attack()

func attack():
	if is_attacking():
		return
	
	$Cooldown.start()
	emit_signal("start_hammer_attack")
	$AttackArea/Collision.disabled = false

func _on_Cooldown_timeout():
	$AttackArea/Collision.disabled = true
	emit_signal("hammer_attack_animation_finished")

func is_attacking():
	return not $Cooldown.is_stopped()

func aim_to(direction):
	match(direction):
		"right":
			scale.x = scale.x
		"left":
			scale.x = -scale.x
