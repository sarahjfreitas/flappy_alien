extends Node

var mute = false

enum SCENES {
	MENU,
	GAME
}

const SCENE_PATHS := {
	SCENES.MENU: preload("res://scenes/main_menu.tscn"),
	SCENES.GAME: preload("res://scenes/game.tscn")
}

func switch_to(scene: SCENES) -> void:
	var packed_scene: PackedScene = SCENE_PATHS[scene]
	get_tree().change_scene_to_packed(packed_scene)
