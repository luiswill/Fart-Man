extends KinematicBody2D

var motion : Vector2 = Vector2(0,0)

const UP = Vector2(0, -1)

const SPEED : int = 1500
const GRAVITY = 300
const JUMP_SPEED = 3000
const WORLD_LIMIT = 3000
const BOOST_MULTIPLAYER = 2

onready var joystick_move := $UI/JoystickMove


func _physics_process(delta):
	apply_gravity()
	jump()
	animate()
	move_and_slide(motion, UP)
	
func _ready():
	EVENTS.connect("update_movement", self, "_move")
	
func _move(movement : Vector2) -> void:
	
	var moving_direction : Vector2 = movement
	moving_direction.x *=  SPEED
	moving_direction.y = 0
	motion = moving_direction
	
func jump():
	if Input.is_action_pressed("ui_up") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()

		
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
