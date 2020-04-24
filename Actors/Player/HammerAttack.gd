extends Node2D

signal start_hammer_attack
signal hammer_attack_animation_finished

onready var scale_x = scale.x
onready var position_x = position.x

export(bool) var DEBUG = false
export(int) var attack_power = 1
onready var attacking_power = Vector2(attack_power, 0)

func _process(delta):
	if Input.is_action_pressed("attack"):
		attack()

func attack():
	if is_attacking():
		_log("already attacking")
		return

	_log("attack")

	$Cooldown.start()
	emit_signal("start_hammer_attack")
	$AttackArea/Collision.disabled = false

func _on_Cooldown_timeout():
	$AttackArea/Collision.disabled = true
	emit_signal("hammer_attack_animation_finished")
	_log("cooldown down")

func is_attacking():
	return not $Cooldown.is_stopped()

func aim_to(direction):
	match(direction):
		"right":
			scale.x = scale_x
			position.x = position_x
			attacking_power.x = attack_power
		"left":
			scale.x = -scale_x
			position.x = position_x - 15
			attacking_power.x = -attack_power

func _on_AttackArea_body_entered(body):
	if body is Pig:
		body.take_damage(attacking_power)

func _log(message):
	if DEBUG:
		print("[HammerAttack] ", message)
