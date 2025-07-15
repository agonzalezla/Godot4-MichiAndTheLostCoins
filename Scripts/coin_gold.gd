extends Area2D

signal coinCollected

func _ready():
	add_to_group("CoinsGoldGroup")
	
	# Conectar directo al HUD
	var hud = get_tree().current_scene.find_child("Control", true, false)
	if hud:
		coinCollected.connect(hud.handlerCoinCollected)

func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		emit_signal("coinCollected")
		queue_free()
