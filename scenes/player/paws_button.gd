extends TextureButton


func _on_pressed() -> void:

	# Toggle "PAWS" menu
	Globals.game_paused = !Globals.game_paused
