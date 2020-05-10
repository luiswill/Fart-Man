extends Node2D


export var call_func : String = "enter_village"


func _on_Area2D_body_entered(body):
	get_tree().call_group("Gamestate", call_func)
