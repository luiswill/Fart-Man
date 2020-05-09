extends AnimatedSprite



func _on_Player_animate(motion : Vector2):
	var animate : String
	if motion.y < 0:
		animate = "jump"

	elif motion.x != 0:
		animate = "walk"

		flip_h = motion.x < 0

	else:
		animate = "idle"

	play(animate)
