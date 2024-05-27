extends Area2D

@onready var game_manager = $"../gameManager"

var levelNumber = 1

func _on_body_entered(body):
	game_manager.add_level()

