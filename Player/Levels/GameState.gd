extends Node2D


var lives = 3
var coins = 0
var money = 100

var beans : int = 0

var target_number_of_coins = 10

func _ready():
	add_to_group("Gamestate")
	update_GUI()


func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	
	
	
func money_up():
	money += 1
	update_GUI()
	
	
func bean_up():
	beans += 1
	update_GUI()
		

func update_GUI():
	get_tree().call_group("GUI", "update_GUI", beans)	

func start_game():
	get_tree().change_scene("res://Scenes/Levels/GameLevel.tscn")
	
func enter_shop():
	get_tree().change_scene("res://Scenes/Shops/GroceryShop.tscn")

func end_game(x_position):
	get_tree().change_scene("res://Scenes/Levels/GameOver.tscn")
	
	GLOBAL.end_score_meters = x_position

	EVENTS.emit_signal("end_game", x_position)

func win_game():
	get_tree().change_scene("res://Scenes/Levels/Victory.tscn")
