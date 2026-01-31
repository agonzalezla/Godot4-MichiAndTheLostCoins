extends Control

@onready var death_label = $PlayerStatisticsPanel/MarginContainer/VBoxContainer/HBoxContainer/DeathLabel
@onready var time_label = $PlayerStatisticsPanel/MarginContainer/VBoxContainer/HBoxContainer2/TimeLabel


func _ready():
	death_label.text = str(Global.deathPlayer)
	time_label.text = GlobalTime.get_formatted_time()


func _on_quit_game_button_pressed() -> void:
	get_tree().quit()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/MainMenu.tscn")
