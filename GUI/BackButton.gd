extends Button


export var scene_to_back = "res://Scenes/Levels/VillageLevel.tscn";

func _on_BackButton_pressed():
	get_tree().change_scene(scene_to_back)
