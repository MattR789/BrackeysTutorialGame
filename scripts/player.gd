extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2D = $AnimatedSprite2D
@onready var jump = $jump
@onready var walking = $walking


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	
	
	
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite_2D.flip_h = false
	elif direction < 0:
		animated_sprite_2D.flip_h = true
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#Plays animation
	if is_on_floor():
		if direction == 0:
			animated_sprite_2D.play("idle")
		else:
			animated_sprite_2D.play("running")
	else:
		animated_sprite_2D.play("jumping")
	move_and_slide()
func _input(event):
	if event.is_action_pressed("Jump"):
		jump.play()
	
	
