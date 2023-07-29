extends Node2D
signal home
var newcoins
var prevcoins
var i=0
func _ready():
	pass
func _on_death():
	$HighScore.text = str(GameData.bestscore)
	$AnimationPlayer.play("In")

func _on_HomeButton2_pressed():
	emit_signal("home")
	$AnimationPlayer.play("Out")

func Visibility():
	$TextureRect.visible= !$TextureRect.visible
	$ScoreText.visible= !$ScoreText.visible
	$HighScoreText.visible= !$HighScoreText.visible
	$Score.visible= !$Score.visible
	$HighScore.visible= !$HighScore.visible
	$CoinsText.visible= !$CoinsText.visible
	$Coins.visible= !$Coins.visible
	$HomeButton2.visible= !$HomeButton2.visible
	$"+".visible=!$"+".visible
	$NewCoins.visible=!$NewCoins.visible

func AddCoins():
	newcoins = int($NewCoins.text)
	prevcoins = int($Coins.text)
	GameData.totalcoins=prevcoins + newcoins
	$AnimationPlayer.play("NewFadeOut")
	if newcoins > 0:
		 $Timer.wait_time= 2.00/newcoins
		 $Timer.start()

func _on_Timer_timeout():
	prevcoins += 1
	newcoins-=1
	$NewCoins.text = str(newcoins)
	$Coins.text = str(prevcoins)
	if newcoins > 0: 
		$Timer.start()


func _on_lilmenu2_home():
	pass # Replace with function body.
