extends Area2D


var levelNumber = 0

func _on_body_entered(body):
	levelNumber = levelNumber + 1
	print(levelNumber)
