extends AnimatedSprite
class_name PlayerAnimation

onready var player: PlayerKing = get_parent()

var next_animation = null

func play_animation(animation_name):
	if animation_name == "attack":
		play("attack")
	else:
		if player.is_attacking():
			next_animation = animation_name 
		else:
			play(animation_name)

func _on_HammerAttack_hammer_attack_animation_finished():
	if next_animation:
		play(next_animation)
		next_animation = null

func _on_State_state_changed(next_state):
	play_animation(next_state)
