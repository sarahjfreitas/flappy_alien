extends Node2D

@onready var player: CharacterBody2D = $Player
var blocks_scene : PackedScene = preload("res://scenes/blocks.tscn")

func _on_spawn_timer_timeout() -> void:
	var new_blocks = blocks_scene.instantiate()
	new_blocks.add_to_group("blocks")
	add_child(new_blocks)

func _on_player_dead() -> void:
	$SpawnTimer.stop()
	$Background.scroll_speed = 0.0
	
	for blocks in get_tree().get_nodes_in_group("blocks"):
		blocks.blocks_speed = 0.0
