extends Node2D

signal hammer_attack_animation_finished

onready var player: PlayerKing = get_parent()

func _input(event):
	if event.is_action_pressed("attack"):
		attack()

func attack():
	if is_attacking():
		return
	
	$Cooldown.start()
	player.animated_sprite.play_animation("attack")
	$AttackArea/Collision.disabled = false

func _on_Cooldown_timeout():
	$AttackArea/Collision.disabled = true
	emit_signal("hammer_attack_animation_finished")

func is_attacking():
	return not $Cooldown.is_stopped()
