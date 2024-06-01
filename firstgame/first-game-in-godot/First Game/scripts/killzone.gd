extends Area2D

# Define onready variables for Timer and Sound Player
@onready var timer = $Timer
@onready var die_sound_player = $DieSoundPlayer  # Reference to die sound player node
@onready var hit_sound_player = $HitSoundPlayer  # Reference to die sound player node

func _on_body_entered(body):
	print("Player hit!")
	Engine.time_scale = 0.5

	# Check if die_sound_player is valid before attempting to play
	if die_sound_player:
		die_sound_player.play()
	else:
		print("Die sound player not found or not ready!")  # Debug statement

	# Optionally queue-free the CollisionShape2D node on the body if it exists
	var collision_shape = body.get_node("CollisionShape2D")
	if collision_shape:
		collision_shape.queue_free()

	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
