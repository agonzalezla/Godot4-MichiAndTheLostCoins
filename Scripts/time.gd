extends Node

var tiempo: float = 0.0
var tiempoCorriendo: bool = true   # Controla si el contador avanza o no

func _process(delta: float) -> void:
	if tiempoCorriendo:
		tiempo += delta

func reiniciar() -> void:
	tiempo = 0.0

func pausar() -> void:
	tiempoCorriendo = false

func reanudar() -> void:
	tiempoCorriendo = true
