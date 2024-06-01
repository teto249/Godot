extends KinematicBody2D

# Declare variables
onready var jump_sound_player = JumpSoundPlayer
var jump_velocity = Vector2(0, -300)
var gravity = 500
var is_on_ground = false

# Called every frame
func _physics_process(delta):
	var velocity = Vector2()

	# Check if the player is on the ground
	if is_on_ground:
		if Input.is_action_just_pressed("ui_jump"):
			velocity += jump_velocity
			jump_sound_player.play()  # Play jump sound

	# Apply gravity
	velocity.y += gravity * delta

	# Move the player
	velocity = move_and_slide(velocity, Vector2.UP)

	# Check if the player is on the ground
	is_on_ground = is_on_floor()

func _ready():
	# Initialize anything necessary
	pass
