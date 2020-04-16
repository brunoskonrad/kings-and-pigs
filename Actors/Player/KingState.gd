extends "res://Scripts/State.gd"

func host() -> PlayerKing:
	return state_machine.host as PlayerKing
