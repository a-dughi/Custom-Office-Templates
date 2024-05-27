extends Node2D

var block = preload("res://Scenes/animatable_body_2d.tscn")
#var movingBlock = preload("res://Scenes/movingBlock.tscn")
var xPos = []
var yPos = []
var numLevels = 1
#figure out how to bypass the first thing, figure out array access issue
# Called when the node enters the scene tree for the first time.

func _ready():
	
	
	# Replace with function body.
		
		for i in range(10):
			var new_block = block.instantiate()
			
			new_block.global_position.x = xPos[i] #randf_range(-100, 100) 
			new_block.global_position.y = yPos[i] #randf_range(-100, 100)
			
			self.add_child(new_block)
			
		#for i in range(10):
			#var newBlock = movingBlock.instantiate()
			#newBlock.global_position.x = randf_range(0,1152)
			#newBlock.global_position.y = randf_range(200, 300)
			
			#self.add_child(newBlock)
			
func _position():
	
	for i in range(numLevels):
		var j = 0
		while j<20:
			var xTemp = randf_range(400, 1000)
			var yTemp = randf_range(200, 500)
			var present = false
			for k in range(xPos.size()):
				var xPrev = xPos[k]
				var yPrev = yPos[k]
				if (xTemp+50==xPrev) || (xTemp-50==xPrev) || (yTemp+50 ==yPrev) || (yTemp-50==yPrev):
					present = true
			if present:
				pass
			else:
				xPos.insert(j*i, xTemp)
				yPos.insert(j*i, yTemp)
				j = j+1
				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#for i in range(20):
		#var new_block = block.instantiate()
			#
		#new_block.global_position.x = randf_range(0, 200) 
		#new_block.global_position.y = randf_range(-100, 100)
			#
		#self.add_child(new_block)
	pass
	
	
	
	
