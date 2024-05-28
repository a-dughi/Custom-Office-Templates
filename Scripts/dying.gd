extends Area2D

@onready var timer = $Timer
#when character collides with the dead zone, start a timer
func _on_body_entered(body):
	timer.start()
#after the timer finishes, the scene is reset
func _on_timer_timeout():
	get_tree().reload_current_scene()
