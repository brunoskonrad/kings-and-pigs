extends KinematicBody2D
class_name PlayerKing

export(int) var speed = 300

onready var velocity: Vector2 = Vector2(0, 0)
const FLOOR = Vector2(0, -1)

var gravity = 1500

var previous_position = Vector2()

onready var animated_sprite: AnimatedSprite = $AnimatedSprite

func _physics_process(delta):
	$State.physics_process(delta)
	
	previous_position = position
	
	if is_on_floor() and !is_jumping():
		velocity.y = 0
		
	if should_jump():
		jump()
		
	velocity.y += gravity * delta

	move_and_slide(velocity, FLOOR)
	
	if is_falling():
		$State.set_state($State/Fall)

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
	$State.set_state($State/Jump)

func is_jumping():
	return !is_on_floor() and velocity.y < 0
	
func is_falling():
	return !is_on_floor() and previous_position.y < position.y

func should_jump():
	return Input.is_action_pressed("jump") and !is_jumping() and is_on_floor()

func _on_State_state_changed(new_state):
	print("*** State changed: ", new_state)
