extends "res://Scripts/State.gd"

func _ready():
	print("state")

func host() -> PlayerKing:
	return state_machine.host as PlayerKing
