extends Control


func _ready():
	display_score()
	
func display_score():
	print("end score meters ", GLOBAL.end_score_meters)
	$CenterContainer/VBoxContainer/MetersScore.text = str(GLOBAL.end_score_meters)


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Levels/VillageLevel.tscn")


func _on_PlayAgainButton_pressed():
	get_tree().change_scene("res://Scenes/Levels/GameLevel.tscn")


func _on_VillageButton_pressed():
	get_tree().change_scene("res://Scenes/Levels/VillageLevel.tscn")
