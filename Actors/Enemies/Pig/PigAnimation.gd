extends AnimatedSprite
class_name PigAnimation

signal hit_animation_finished
signal dead_animation_finished

func _on_State_state_changed(state):
	play(state)

func _on_AnimatedSprite_animation_finished():
	if animation == "hit":
		emit_signal("hit_animation_finished")
		return

	if animation == "dead":
		emit_signal("dead_animation_finished")
		return
