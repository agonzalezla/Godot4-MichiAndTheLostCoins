extends Control


func _ready() -> void:
	# Permite usar el teclado en el menu principal
	# Se fija el cursor en el boton de Start
	$VBoxContainer/StartGameButton.grab_focus()


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")


func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
