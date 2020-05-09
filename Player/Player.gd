extends KinematicBody2D

var motion : Vector2 = Vector2(0,0)

const UP = Vector2(0, -1)


const SPEED : int = 1500
const GRAVITY = 300
const JUMP_SPEED = 3000
const WORLD_LIMIT = 3000
const BOOST_MULTIPLAYER = 2



signal animate


func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)
	
	
func jump():
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()	
			
func move():
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	else:
		motion.x = 0
		
		
func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("Gamestate", "end_game")
	
	
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY
	
	
	
func animate():
	emit_signal("animate", motion)



func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	$HurtSFX.play()	
	motion.y = -JUMP_SPEED
#	lives -= 1
#	if lives < 0:
#		end_game()

func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = JUMP_SPEED * BOOST_MULTIPLAYER
