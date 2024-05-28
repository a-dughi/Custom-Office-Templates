extends Node2D

var block = preload("res://Scenes/animatable_body_2d.tscn")

var xPos = []
var yPos = []
var numLevels = 1

# Called when the node enters the scene tree for the first time.

func _ready():
	# Replace with function body.
		_position()
	
		for i in range(10):
			var new_block = block.instantiate()
			
			new_block.global_position.x = xPos[i]  
			new_block.global_position.y = yPos[i] 
			
			self.add_child(new_block)
			
			
func _position():
	for i in range(numLevels):	
		var j = 0;
		while j<10:
			var xTemp = randf_range(0, 100)
			var yTemp = randf_range(-200, 100)
			var present = false
			for k in range(xPos.size()):
				var xPrev = xPos[k]
				var yPrev = yPos[k]
				if ((xTemp<xPrev+50) && (xTemp>xPrev-50)) && ((yTemp<yPrev+50) && (yTemp>yPrev-50)):
					present = true
				
			if present:
				pass
			else:
				xPos.insert(j*i, xTemp)
				yPos.insert(j*i, yTemp)
				j = j+1


				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass
	
	
	
	
