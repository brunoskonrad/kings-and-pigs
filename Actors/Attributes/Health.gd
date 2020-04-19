extends Node

export(int) var max_health = 3
onready var health = max_health

func is_alive():
	return health > 0

func is_dead():
	return health <= 0

func take_damage(damage):
	health -= damage

func heal(amount):
	health += min(health + amount, max_health)
