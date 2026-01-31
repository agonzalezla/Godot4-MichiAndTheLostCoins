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

func get_formatted_time() -> String:
	var t = tiempo
	var minutos = int(t / 60)
	var segundos = int(t) % 60
	var ms = int((t - int(t)) * 100)
	return "%02d:%02d:%02d" % [minutos, segundos, ms]
