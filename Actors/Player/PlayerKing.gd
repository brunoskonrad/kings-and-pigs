extends KinematicBody2D

var animated_sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = $AnimatedSprite

func _process(delta):
	pass

func get_input_direction():
	if Input.is_action_pressed("ui_left"):
		return "left"
	if Input.is_action_pressed("ui_right"):
		return "right"
	return null

func _on_State_state_changed(new_state):
	print(new_state)
