extends CanvasLayer

func _ready():
	pass
	#$Control/TextureRect/HBoxContainer/LifeCount.text = "3"
	
	
func update_GUI(beans):
#	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)
#	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)
	print("BEans now  : ", beans)
	$Inventory/Bean/BeansAmount.text = str(beans)
	pass
