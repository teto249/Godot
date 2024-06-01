extends Node

var is_muted = false
var music_nodes = []


func _ready():
	music_nodes = get_tree().get_nodes_in_group("music")
	for node in music_nodes:
		if node.is_a("AudioStreamPlayer"):
			node.mute = is_muted

func toggle_mute():
	is_muted = !is_muted
	for node in music_nodes:
		if node.is_a("AudioStreamPlayer"):
			node.mute = is_muted
