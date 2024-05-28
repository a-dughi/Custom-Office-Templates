extends Area2D

@onready var coin_text = $CanvasLayer/CoinCounter		
var coinCount = 0
func _on_body_entered(body):
	queue_free()
	coinCount += 1
	#coin_text.text = "Coins: " + str(coinCount)
	
	
