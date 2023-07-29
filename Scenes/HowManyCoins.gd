extends Node2D

func _ready():
	GameData.loadTotalCoins()
	$TotalCoins.text = str(GameData.totalcoins)
