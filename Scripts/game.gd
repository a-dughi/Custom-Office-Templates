extends Node2D

var block = preload("res://Scenes/animatable_body_2d.tscn")
var coin = preload("res://Scenes/coin.tscn")
var body = preload("res://Scenes/character_body_2d.tscn")

var xPos = []
var yPos = []
var coinArray = []
var numLevels = 6

# Called when the node enters the scene tree for the first time.

func _ready():
	# Replace with function body.
		_position()
	
	#16 blocks per level, creates block and defines position
		for i in range(16*numLevels):
			var new_block = block.instantiate()
			
			new_block.global_position.x = xPos[i]  
			new_block.global_position.y = yPos[i] 
			
			#creates coins at every 3rd block
			var new_coin
			if(i%3==0):
				new_coin = coin.instantiate()
				coinArray.insert(i/3, new_coin)
				new_coin.global_position.x = xPos[i]
				new_coin.global_position.y = yPos[i]-10
			
			self.add_child(new_block)
			self.add_child(new_coin)

#creates arrays of random position values for x and y coordinates of blocks
func _position():
	for i in range(numLevels):	
		var j = 0;
		while j<16:
			#constant range of x values
			var xTemp = randf_range(-50, 100)
			#changes range of y values based on level
			var yTemp = randf_range(-400*(i+1), (-400*(i+1))+400)
			var present = false
			
			for k in range(xPos.size()):
				var xPrev = xPos[k]
				var yPrev = yPos[k]
				#checks block coordinates against previous blocks to avoid overlap
				if ((xTemp<xPrev+35) && (xTemp>xPrev-35)) && ((yTemp<yPrev+35) && (yTemp>yPrev-35)):
					present = true
				
			if present:
				pass
			#sets position values in x and y arrays
			else:
				xPos.insert(j*i, xTemp)
				yPos.insert(j*i, yTemp)
				j = j+1
			


@onready var coin_text = $CanvasLayer/CoinCounter				

# Called every fframe. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	#var numCoins = 0
	#for i in range(coinArray.size()):
		#if coinArray[i]._on_body_entered(body):
			#numCoins = numCoins +1
			#
	#coin_text.text = str(numCoins)	
	
	
	
	
	
