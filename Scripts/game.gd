extends Node2D

var block = preload("res://Scenes/animatable_body_2d.tscn")
var coin = preload("res://Scenes/coin.tscn")

var xPos = []
var yPos = []
var numLevels = 1

# Called when the node enters the scene tree for the first time.

func _ready():
	# Replace with function body.
		_position()
	
		for i in range(5):
			var new_block = block.instantiate()
			
			new_block.global_position.x = xPos[i]  
			new_block.global_position.y = yPos[i] 
			var new_coin
			if(i%3==0):
				new_coin = coin.instantiate()
				new_coin.global_position.x = xPos[i]
				new_coin.global_position.y = yPos[i]-10
			
			self.add_child(new_block)
			self.add_child(new_coin)
			
func _position():
	for i in range(numLevels):	
		var j = 0;
		while j<5:
			var xTemp = randf_range(0, 100)
			var yTemp = randf_range(-200, 50)
			var present = false
			for k in range(xPos.size()):
				var xPrev = xPos[k]
				var yPrev = yPos[k]
				if ((xTemp<xPrev+40) && (xTemp>xPrev-40)) && ((yTemp<yPrev+50) && (yTemp>yPrev-50)):
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
	
	
	
	
