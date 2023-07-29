extends Node2D

var ItemSelected
enum {SMILEY,SAD,ASTRO,DUCK,EYE,ANGRY,FACKAF,SPIRAL,SPIRALWOW,TEDDY,TURTLE}
signal purchase

func _ready():
	if GameData.soundonoff==true: $AudioStreamPlayer.play()
	GameData.loadTotalCoins()
	preload("res://Scenes/Main.tscn")

func _on_BackButton_pressed():
	Transition.FadeTo("res://Scenes/Main.tscn")


func _on_ScrollableChoices_succesfulChoice():
	if $ScrollableChoices.skinAvailable($ScrollableChoices.ItemCurrentIndex):
		ItemSelected=$ScrollableChoices.ItemCurrentIndex
		$ScrollableChoices.ItemNodes[ItemSelected].get_node("Label2").visible=!$ScrollableChoices.ItemNodes[ItemSelected].get_node("Label2").visible
		if $ScrollableChoices.ItemNodes[$ScrollableChoices.ItemCurrentIndex].get_node("Label2").visible:
			GameData.skin=ItemSelected
			setAllOtherSelectedsInvisible(ItemSelected)
			#print("Skin selected: "+ str(GameData.skin))
		else:
			GameData.skin=-1
			#print("Skin back to default")
	else:
		var ItemValue=int($ScrollableChoices.ItemNodes[$ScrollableChoices.ItemCurrentIndex].get_node("Label").text)
		if GameData.totalcoins>=ItemValue:
			GameData.totalcoins-=ItemValue
			ItemSelected=$ScrollableChoices.ItemCurrentIndex
			GameData.skin=ItemSelected
			UpdateSkinInfo(ItemSelected)
			$ScrollableChoices.ItemNodes[ItemSelected].get_node("Label2").visible=true
			$HowManyCoins/TotalCoins.text=str(GameData.totalcoins)
			emit_signal("purchase")

func UpdateSkinInfo(index):
	match index:
		SMILEY:
			GameData.haveSmile=true
		SAD:
			GameData.haveSad=true
		ASTRO:
			GameData.haveAstro=true
		DUCK:
			GameData.haveDuck=true
		EYE:
			GameData.haveEye=true
		ANGRY:
			GameData.haveAngry=true
		FACKAF:
			GameData.haveFackaf=true
		SPIRAL:
			GameData.haveSpiral=true
		SPIRALWOW:
			GameData.haveSpiralwow=true
		TEDDY:
			GameData.haveTeddy=true
		TURTLE:
			GameData.haveTurtle=true

func setAllOtherSelectedsInvisible(item_selected):
	for node in $ScrollableChoices.ItemNodes:
		if node!=$ScrollableChoices.ItemNodes[item_selected]:
			node.get_node("Label2").visible=false
