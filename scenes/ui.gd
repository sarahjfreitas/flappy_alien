extends Control

var heart : Texture2D = preload("res://assets/sprites/hud_heart.png")
var heart_empty : Texture2D = preload("res://assets/sprites/hud_heart_empty.png")

func update_health(health : int):
	var h = max(health, 3)
	
	if health >= 3:
		%Life3.texture = heart
	else:
		%Life3.texture = heart_empty
		
	if health >= 2:
		%Life2.texture = heart
	else:
		%Life2.texture = heart_empty
		
	if health >= 1:
		%Life1.texture = heart
	else:
		%Life1.texture = heart_empty


func _on_player_hit(health : int) -> void:
	update_health(health)
