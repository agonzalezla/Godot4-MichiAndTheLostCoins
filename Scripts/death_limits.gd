extends Area2D


func _on_body_entered(body: Node2D) -> void:
	
	if body.get_name() == "Player":
		Global.deathPlayer += 1
		get_tree().reload_current_scene()
