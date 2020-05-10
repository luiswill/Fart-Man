extends TextureButton

func _input(event):
	if event is InputEventScreenTouch:
		print("jump")
		EVENTS.emit_signal("jump_character")
