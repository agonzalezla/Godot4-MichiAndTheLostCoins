extends Control

##@onready var options_popup: PopupPanel = $OptionsPopup
@onready var options_menu = $OptionsMenu

func _ready() -> void:
	# Permite usar el teclado en el menu principal
	# Se fija el cursor en el boton de Start
	$VBoxContainer/StartGameButton.grab_focus()
	GlobalTime.pausar()  # Aseguramos que el tiempo no avance en el menú


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Level1.tscn")


func _on_quit_game_button_pressed() -> void:
	get_tree().quit()


func _on_options_button_pressed() -> void:
	#get_tree().change_scene_to_file("res://Scenes/UI/OptionsMenu.tscn")
	##options_popup.popup_centered()
	#options_menu.open_menu()
	pass
