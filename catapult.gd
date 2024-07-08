extends CharacterBody2D

var rock_scene = preload("rock.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()

func _input(event):
	if Game.fire==true:
		$fire.play('fire')
		$Timer.start()

func launch_rock():
	var rock_instance = rock_scene.instantiate()
	
	rock_instance.global_position = self.global_position
	rock_instance.global_position.y=position.y-50
	add_sibling(rock_instance)
	rock_instance.apply_impulse(Vector2((900*Game.x_velocity/100)+200, (-900*Game.y_velocity/100)-200), Vector2.ZERO)


func _on_timer_timeout():
	launch_rock()
	Game.stoneOnGround=false
	Game.fire=false
	Game.turn=true
	var audio = get_node('../AudioStreamPlayer2D2')
	audio.play()
