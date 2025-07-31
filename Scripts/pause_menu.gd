extends Control

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("pause"):
		print("Pausa")
		visible = not get_tree().paused
		get_tree().paused = not get_tree().paused
