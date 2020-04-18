extends AnimatedSprite
class_name PlayerAnimation

onready var player: PlayerKing = get_parent()

export(bool) var DEBUG = false
var next_animation = null

func play_animation(animation_name):
	_log("play %s" % animation_name)
	
	if animation_name == "attack":
		play("attack")
	else:
		_log("is_attacking: %s" % player.is_attacking())
		if player.is_attacking():
			next_animation = animation_name 
		else:
			play(animation_name)

func _on_Hammer_hammer_attack_animation_finished():
	if next_animation:
		play(next_animation)
		next_animation = null
	else:
		play("idle")

func _on_State_state_changed(next_state):
	play_animation(next_state)

func _on_Hammer_start_hammer_attack():
	play_animation("attack")
	
func _log(message):
	if DEBUG:
		print("[PlayerAnimation] ", message)
