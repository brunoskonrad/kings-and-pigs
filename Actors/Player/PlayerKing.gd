extends KinematicBody2D
class_name PlayerKing

var animated_sprite: AnimatedSprite

export(int) var speed = 300

onready var velocity: Vector2 = Vector2(speed, 0)
var direction: Vector2 = Vector2()

func _physics_process(delta):
	var destination = velocity * direction * delta
	
	move_and_collide(destination)

func run(running_direction):
	match running_direction:
		"right":
			direction = Vector2(1, 0)
			$AnimatedSprite.set_flip_h(false)
		"left":
			direction = Vector2(-1, 0)
			$AnimatedSprite.set_flip_h(true)
		_:
			direction = Vector2()

func get_input_direction():
	if Input.is_action_pressed("ui_left"):
		return "left"
	if Input.is_action_pressed("ui_right"):
		return "right"
	return null

func play_animation(animation):
	$AnimatedSprite.play(animation)

func _on_State_state_changed(new_state):
	print(new_state)
	
