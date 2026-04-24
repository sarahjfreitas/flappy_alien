extends Node2D

@onready var player: CharacterBody2D = $Player
var blocks_scene : PackedScene = preload("res://scenes/blocks.tscn")

func _on_spawn_timer_timeout() -> void:
	add_child(blocks_scene.instantiate())
