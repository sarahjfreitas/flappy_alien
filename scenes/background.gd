extends Node2D

@onready var sky: Parallax2D = $Sky
@onready var ground: Parallax2D = $Ground

@export var scroll_speed := 20.0

const AUTO_SCROLL_MULTIPLIER := -1000.0

func _process(delta: float) -> void:
	sky.autoscroll.x = scroll_speed *  sky.scroll_scale.x * AUTO_SCROLL_MULTIPLIER * delta
	ground.autoscroll.x = scroll_speed *  ground.scroll_scale.x * AUTO_SCROLL_MULTIPLIER * delta
