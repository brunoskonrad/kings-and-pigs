extends KinematicBody2D
class_name PlayerKing

export(int) var speed = 300

onready var velocity: Vector2 = Vector2(0, 0)
const FLOOR = Vector2(0, -1)

var gravity = 1500
var is_jumping = false

onready var animated_sprite: AnimatedSprite = $AnimatedSprite

func _physics_process(delta):
	$State.physics_process(delta)
	
	if is_on_floor() and !is_on_air():
		velocity.y = 0
		if is_jumping:
			is_jumping = false
			$State.set_state($State/Idle)
		
	if should_jump():
		jump()
		
	velocity.y += gravity * delta

	move_and_slide(velocity, FLOOR)

func get_running_direction():
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	
	if left and right:
		return null
	if left:
		return "left"
	if right:
		return "right"
	return null

func jump():
	velocity.y = -550
	animated_sprite.play("jump")
	is_jumping = true

func is_on_air():
	return $State.state.state_name == 'jump'

func should_jump():
	return Input.is_action_pressed("jump") and !is_on_air() and is_on_floor()
