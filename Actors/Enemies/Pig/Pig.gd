extends KinematicBody2D
class_name Pig

var velocity = Vector2()
const GRAVITY = 10
const FLOOR = Vector2(0, -1)

func _physics_process(delta):
	$State.physics_process(delta)

	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y += GRAVITY

	move_and_slide(velocity, FLOOR)

func is_invulnerable():
	return not $DamageCooldown.is_stopped()

func idle():
	$State.set_state($State/Idle)

func take_damage(attack_power):
	if not is_invulnerable():
		$DamageCooldown.start()
		$State.set_state($State/Hit)
		$Health.take_damage(1)

		velocity.x = 50 * attack_power.x

func die():
	$State.set_state($State/Dead)

func _on_AnimatedSprite_hit_animation_finished():
	if $Health.is_dead():
		die()
	else:
		idle()
		velocity.x = 0

func _on_AnimatedSprite_dead_animation_finished():
	queue_free()
