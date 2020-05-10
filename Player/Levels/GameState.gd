extends Node2D


var lives = 3
var coins = 0
var money = 100

var target_number_of_coins = 10

func _ready():
	add_to_group("Gamestate")
	update_GUI()


func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	
	
	if lives < 0:
		end_game()
	
	
func money_up():
	money += 1
	update_GUI()
		

func update_GUI():
	get_tree().call_group("GUI", "update_GUI", lives, coins)	

func start_game():
	get_tree().change_scene("res://Scenes/Levels/GameLevel.tscn")
	
func enter_shop():
	get_tree().change_scene("res://Scenes/Shops/GroceryShop.tscn")

func end_game():
	get_tree().change_scene("res://Scenes/Levels/GameOver.tscn")


func win_game():
	get_tree().change_scene("res://Scenes/Levels/Victory.tscn")
