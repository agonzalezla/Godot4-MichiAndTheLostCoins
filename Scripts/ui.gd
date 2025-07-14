extends Control

var coins = 0

func _ready():
	# Mostrar el contador inicial
	$CoinsCollectedText.text = str(coins)

	# ✅ Obtener todos los nodos del grupo
	var coins_gold = get_tree().get_nodes_in_group("CoinsGoldGroup")

	# Conectar cada uno
	for coin in coins_gold:
		coin.coinCollected.connect(handlerCoinCollected)

func handlerCoinCollected():
	coins += 1
	$CoinsCollectedText.text = str(coins)
