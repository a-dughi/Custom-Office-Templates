extends Area2D


var coinCount = 0
func _on_body_entered(body):
	queue_free()
	coinCount += 1
	
	
