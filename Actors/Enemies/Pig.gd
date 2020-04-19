extends KinematicBody2D
class_name Pig

var velocity = Vector2()
const GRAVITY = 10
const FLOOR = Vector2(0, -1)

func _physics_process(delta):
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y += GRAVITY
	
	move_and_slide(velocity, FLOOR)

func is_invulnerable():
	return not $DamageCooldown.is_stopped()

func take_damage():
	if not is_invulnerable():
		$DamageCooldown.start()
		$AnimatedSprite.play("hit")

		$Health.take_damage(1)
		velocity.x = 50
		

func _on_DamageCooldown_timeout():
	pass

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("idle")
	velocity.x = 0
	if $Health.is_dead():
		queue_free()
