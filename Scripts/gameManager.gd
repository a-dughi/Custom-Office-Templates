extends Node


var level = 1
@onready var level_text = $CanvasLayer/Level
func add_level():
	level += 1
	level_text.text = "Level: " + str(level)
