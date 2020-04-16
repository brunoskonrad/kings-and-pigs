extends KinematicBody2D
class_name PlayerKing

export(int) var speed = 300

onready var velocity: Vector2 = Vector2(speed, 0)
var direction: Vector2 = Vector2()

onready var animated_sprite: AnimatedSprite = $AnimatedSprite

func _physics_process(delta):
	var destination = velocity * direction * delta
	
	move_and_collide(destination)

func get_input_direction():
	if Input.is_action_pressed("ui_left"):
		return "left"
	if Input.is_action_pressed("ui_right"):
		return "right"
	return null

