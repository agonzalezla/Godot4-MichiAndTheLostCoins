extends Control

var coins = 0 # Numero de monedas recogidas por el jugador
var totalCoinsInLevel = 0 # Numero de monedas totales en el nivel

# Lista fija de niveles en orden
var levels = [
	"res://Scenes/Levels/Level1.tscn",
	"res://Scenes/Levels/Level2.tscn",
    "res://Scenes/Levels/Level3.tscn"
]

func _ready():
	await get_tree().process_frame  # Espera un frame para asegurar que todo esté en escena
	
	# Obtener todos los nodos del grupo de monedas
	var coins_gold = get_tree().get_nodes_in_group("CoinsGoldGroup")
	totalCoinsInLevel = coins_gold.size()
	
	# Mostrar contador inicial
	$PanelMonedas/MarginContainer/GridContainer/CoinsCollectedText.text = str(coins) + " / " + str(totalCoinsInLevel)
	
	# Conectar cada moneda al handler
	for coin in coins_gold:
		coin.coinCollected.connect(handlerCoinCollected)


func handlerCoinCollected():
	coins += 1
	$PanelMonedas/MarginContainer/GridContainer/CoinsCollectedText.text = str(coins) + " / " + str(totalCoinsInLevel)
	
	# Cambiar de nivel al recoger todas las monedas
	if coins == totalCoinsInLevel:
		await get_tree().create_timer(0.2).timeout
		go_to_next_level()


func go_to_next_level():
	var current_path = get_tree().current_scene.scene_file_path
	var index = levels.find(current_path)
	
	if index != -1 and index + 1 < levels.size():
		get_tree().change_scene_to_file(levels[index + 1])
	else:
		get_tree().change_scene_to_file("res://Scenes/UI/ComingSoon.tscn")
		

func _process(delta: float) -> void:
	var total = GlobalTime.tiempo
	var horas = int(total / 3600)
	var minutos = int(total / 60)
	var segundos = int(total) % 60
	#var centesimas = int((total - int(total)) * 100)
	
	#$TimeElapsedText.text = "%02d:%02d:%02d" % [horas, minutos, segundos]
	$TimeElapsedText.text = "%02d:%02d" % [minutos, segundos]
	#$TimeElapsedText.text = "%02d:%02d:%02d.%02d" % [horas, minutos, segundos, centesimas]
	#$TimeElapsedText.text = str(round(GlobalTime.tiempo))
