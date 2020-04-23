extends Node

onready var player: PlayerKing = get_parent()

func _physics_process(delta):
	match player.get_running_direction():
		"right":
			move_to_right()
		"left":
			move_to_left()
		_:
			halt()

func move_to_right():
	player.velocity.x = player.speed
	player.face_right()

func move_to_left():
	player.velocity.x = -player.speed
	player.face_left()

func halt():
	player.velocity.x = 0
