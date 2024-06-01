extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var die_sound_player = $hitSoundPlayer  # Reference to die sound player node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Check for collisions with ray casts
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	
	# Move the node based on direction and speed
	position.x += direction * SPEED * delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("Player hit by slime!")
		
		# Emit a signal to inform the player node about the collision
		emit_signal("player_hit")

		# Play die sound if available
		if die_sound_player:
			die_sound_player.play()
		else:
			print("Die sound player not found or not ready!")  # Debug message if die_sound_player is not valid
