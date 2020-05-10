extends "res://Items/ItemTemplate.gd"

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		$AnimationPlayer.play("Die")
		$AudioStreamPlayer2D.play()
		get_tree().call_group("Gamestate", "bean_up")

