extends Control


func _on_new_button_pressed() -> void:
	game_manager.switch_to(game_manager.SCENES.GAME)

func _on_mute_button_pressed() -> void:
	$MuteButton.hide()
	$UnmuteButton.show()
	game_manager.mute = true

func _on_unmute_button_pressed() -> void:
	$MuteButton.show()
	$UnmuteButton.hide()
	game_manager.mute = false

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _process(delta: float) -> void:
	if game_manager.mute and $BackgroundAudio.playing:
		$BackgroundAudio.stop()
		
	if !game_manager.mute and !$BackgroundAudio.playing:
		$BackgroundAudio.play()
