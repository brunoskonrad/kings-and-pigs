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
		$AnimatedSprite.play("hit")
		$DamageCooldown.start()

func _on_DamageCooldown_timeout():
	$AnimatedSprite.play("idle")
