extends KinematicBody2D
class_name PlayerKing

export(int) var speed = 300

onready var velocity: Vector2 = Vector2(speed, 0)
var direction: Vector2 = Vector2(0, 1)

var gravity = 1500

onready var animated_sprite: AnimatedSprite = $AnimatedSprite

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	var destination = velocity * direction
	
	move_and_slide(destination, Vector2(0, -1))

func get_input_direction():
	if Input.is_action_pressed("ui_left"):
		return "left"
	if Input.is_action_pressed("ui_right"):
		return "right"
	return null

