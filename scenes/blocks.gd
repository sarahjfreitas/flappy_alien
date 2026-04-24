extends Node2D

@export var blocks_speed := 200.0

var block_scene :PackedScene = preload("res://scenes/block.tscn")
var tile_size := 128.0
const TOP_BLOCKS_MIN := 2 
const TOP_BLOCKS_MAX := 8 
const GAP_MIN := 2
const GAP_MAX := 4

func _ready() -> void:
	var viewport_size := get_viewport_rect().size
	
	# horizontal spawn position
	var spawn_x = viewport_size.x + tile_size + 50
	position = Vector2(spawn_x, 0)
	
	# getting random sizes
	var gap_blocks = randi_range(GAP_MIN,GAP_MAX)
	var amount_top = randi_range(TOP_BLOCKS_MIN, TOP_BLOCKS_MAX)
	
	# top block pile
	for i in range(amount_top):
		create_block(i * tile_size)
	
	# bottom block pile
	var bottom_block_y = (amount_top * tile_size) + (gap_blocks * tile_size)
	while(bottom_block_y - tile_size < viewport_size.y):
		create_block(bottom_block_y)
		bottom_block_y += tile_size

func _process(delta: float) -> void:
	position.x -= blocks_speed * delta
	
	if position.x <= (tile_size * -1) - 100:
		queue_free()

func create_block(y : float) -> void:
	var block : StaticBody2D = block_scene.instantiate()
	add_child(block)
	block.position = Vector2(0, y)
