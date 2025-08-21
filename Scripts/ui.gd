extends Control

var coins = 0 # Numero de monedas recogidas por el jugador
var totalCoinsInLevel = 0 # Numero de monedas totales en el nivel

func _ready():
	await get_tree().process_frame  # Espera un frame para asegurar que todo esté en escena
	
	# Mostrar el contador inicial
	#$CoinsCollectedText.text = str(coins)

	# Obtener todos los nodos del grupo
	var coins_gold = get_tree().get_nodes_in_group("CoinsGoldGroup")

	# Guardar el total
	totalCoinsInLevel = coins_gold.size()
	
	# Mostrar el contador inicial
	$CoinsCollectedText.text = str(coins) + " / " + str(totalCoinsInLevel)
	
	# Conectar cada uno
	for coin in coins_gold:
		coin.coinCollected.connect(handlerCoinCollected)

func handlerCoinCollected():
	coins += 1
	#$CoinsCollectedText.text = str(coins)
	$CoinsCollectedText.text = str(coins) + " / " + str(totalCoinsInLevel)
	
	var current_scene_name = get_tree().current_scene.name

	# Cambiar de nivel al recoger todas las monedas
	#if coins == totalCoinsInLevel && current_scene_name == "Level":
	#	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
	#if coins == totalCoinsInLevel && current_scene_name == "Level2":
	#	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
		
	# Cambiar de nivel al recoger todas las monedas, detecta el nivel actual y salta al siguiente.
	if coins == totalCoinsInLevel:
		await get_tree().create_timer(0.2).timeout
		#get_tree().change_scene_to_file("res://Scenes/Level" + str(int(get_tree().current_scene.name) + 1)  + ".tscn")	
		
		var current_level_num = int(get_tree().current_scene.name)
		var next_level_path = "res://Scenes/Level" + str(current_level_num + 1) + ".tscn"
	
		if FileAccess.file_exists(next_level_path):
			get_tree().change_scene_to_file(next_level_path)
		else:
			get_tree().change_scene_to_file("res://Scenes/ComingSoon.tscn")
