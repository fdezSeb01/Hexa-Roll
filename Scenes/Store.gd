extends Node2D
func _ready():
	preload("res://Scenes/Main.tscn")
	$check.position.y= -100
	if GameData.haveangry==true:
		$ProductAngry/Angry/AnimatedSprite.visible=true
		$ProductAngry/Angry/Sprite.visible=false
	if GameData.havesmile==true: 
		$ProductSmile/Smile/AnimatedSprite.visible=true
		$ProductSmile/Smile/Sprite.visible=false
	if GameData.havefack==true: 
		$ProductFuck/Fack/AnimatedSprite.visible=true
		$ProductFuck/Fack/Sprite.visible=false
	if GameData.soundonoff==true: $AudioStreamPlayer.play()
func _on_BackButton_pressed():
	Transition.FadeTo("res://Scenes/Main.tscn")


func _on_Smile_pressed():
	if GameData.havesmile==true:
		if $check.position.y==281:
			GameData.skin=0
			$check.position.y=-100
			return
		$check.position.y=281
		GameData.skin=1
		return
	if GameData.totalcoins<50:return
	GameData.totalcoins-=50
	GameData.havesmile=true
	GameData.skin=1
	$check.position.y=281
	$ProductSmile/Smile/AnimatedSprite.visible=true
	$ProductSmile/Smile/Sprite.visible=false
	$HowManyCoins/TotalCoins.text = str(GameData.totalcoins)


func _on_Angry_pressed():
	if GameData.haveangry==true:
		if $check.position.y==547:
			$check.position.y=-100
			GameData.skin=0
			return
		$check.position.y=547
		GameData.skin=2
		return
	if GameData.totalcoins<100:return
	$ProductAngry/Angry/AnimatedSprite.visible=true
	$ProductAngry/Angry/Sprite.visible=false
	GameData.totalcoins-=100
	GameData.skin=2
	GameData.haveangry=true
	$check.position.y=547
	$HowManyCoins/TotalCoins.text = str(GameData.totalcoins)


func _on_Fack_pressed():
	if GameData.havefack==true:
		if $check.position.y==829:
			$check.position.y=-100
			GameData.skin=0
			return
		$check.position.y=829
		GameData.skin=3
		return
	if GameData.totalcoins<200:return
	$ProductFuck/Fack/AnimatedSprite.visible=true
	$ProductFuck/Fack/Sprite.visible=false
	GameData.totalcoins-=200
	GameData.havefack=true
	GameData.skin=3
	$check.position.y=829
	$HowManyCoins/TotalCoins.text = str(GameData.totalcoins)
