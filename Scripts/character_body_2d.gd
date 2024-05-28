extends CharacterBody2D


const SPEED = 150.0

const JUMP_VELOCITY = -400.0
var characterPos = global_position.y

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#default godot code for physics of a character
#allows character to jump, move left, and move right
func _physics_process(delta):
	characterPos = global_position.y
	add_level()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
@onready var level_text = $CanvasLayer/Level
	
#changes level based on which range of elevation the character is in
func add_level():
	if characterPos > -50 && characterPos < 100:
			level_text.text = "Level: 1"
	if characterPos > -450 && characterPos < -50:
			level_text.text = "Level: 2" 
	if characterPos > -850 && characterPos < -450:
			level_text.text = "Level: 3" 		
	if characterPos > -1250 && characterPos < -850:
			level_text.text = "Level: 4" 
	if characterPos > -1650 && characterPos < -1250:
			level_text.text = "Level: 5" 		
	if characterPos > -2050 && characterPos < -1650:
			level_text.text = "Level: 6" 
	

