extends RigidBody2D
class_name Pickle

func _ready():
	var pickle_types = Array($PickleAnimation.sprite_frames.get_animation_names())
	$PickleAnimation.animation = pickle_types.pick_random()
	$PickleAnimation.play()
	
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
