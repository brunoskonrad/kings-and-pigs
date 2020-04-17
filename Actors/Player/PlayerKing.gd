extends KinematicBody2D
class_name PlayerKing

export(int) var speed = 300

onready var velocity: Vector2 = Vector2(0, 0)
const FLOOR = Vector2(0, -1)

var gravity = 1500

onready var animated_sprite: AnimatedSprite = $AnimatedSprite

func _physics_process(delta):
	$State.physics_process(delta)
	
	if is_on_floor() and !is_on_air():
		velocity.y = 0
		
	velocity.y += gravity * delta

	move_and_slide(velocity, FLOOR)

func get_input_direction():
	if Input.is_action_pressed("ui_left"):
		return "left"
	if Input.is_action_pressed("ui_right"):
		return "right"
	if Input.is_action_pressed("jump"):
		return "jump"
	return null

func is_on_air():
	return $State.state.state_name == 'jump'

func can_jump():
	return !is_on_air() && is_on_floor()
