extends Node2D #hard mode
export (PackedScene) var Ballscene
var BallVelocity = 100
var score =0
var coins =0
var direction
var CoinBarDecreaseVelocity
var CoinBarOnCenterCollisionDecrease
signal pointUp
signal changeHexagonDirection
var Death=false
var mode="hard"

func _ready():
	randomize()
	$GameButtons/MenuButton.visible = false
	$GameButtons/SettingsButton.visible=false
	$GameButtons/PauseButton.visible = true
	if GameData.soundonoff==true: $AudioStreamPlayer.play()
	CoinBarDecreaseVelocity=3
	CoinBarOnCenterCollisionDecrease=1000
	GameData.loadAllHaveSkins()

func _on_BallTimer_timeout():
	var BallPrefab = Ballscene.instance()
	var r = randi()%2
	add_child(BallPrefab)
	SetBallVelocity(score)
	match r:
		0:
			BallPrefab.position = $PositionUp.position
			direction = PI/2
		1: 
			BallPrefab.position = $PositionDown.position
			direction = -PI/2
	BallPrefab.set_linear_velocity(Vector2(BallVelocity,0).rotated(direction))

func SetBallVelocity(score):
	if score < 3: BallVelocity = 110
	elif score > 3 and score < 10: 
		BallVelocity = 135
		CoinBarDecreaseVelocity=4
		$BallTimer.wait_time = 4
	elif score > 10 and score < 14: 
		BallVelocity = 160
		CoinBarDecreaseVelocity=5
		$BallTimer.wait_time = 3.5
	elif score >14 and score< 18: 
		BallVelocity = 205
		CoinBarDecreaseVelocity=6
		$BallTimer.wait_time = 1.8
	else:
		BallVelocity=235
		CoinBarDecreaseVelocity=7
		$BallTimer.wait_time=1.3




func _on_Hexagon_pointCollision():
	score +=1
	emit_signal("pointUp")
	if score > GameData.bestscore: GameData.bestscore = score
	var Balls = get_tree().get_nodes_in_group("Balls")
	Balls[0].queue_free()




func _on_Hexagon_collisionOnCenter():
	var Balls = get_tree().get_nodes_in_group("Balls")
	Balls[0].queue_free()


func _on_death():
	Death=true
	preload("res://Scenes/Main.tscn")
	GameData.loadBestScore()
	GameData.loadTotalCoins()
	$endMenu2/NewCoins.text = str(coins)
	$endMenu2/Coins.text = str(GameData.totalcoins)
	$endMenu2/Score.text = str(score)
	$BallTimer.stop()
	var Balls = get_tree().get_nodes_in_group("Balls")
	for ball in Balls:
		ball.queue_free()


func _on_GameButtons_pause():
	$lilmenu2/AnimationPlayer.play("In")
	preload("res://Scenes/Main.tscn")
	$BallTimer.stop()
	var Balls = get_tree().get_nodes_in_group("Balls")
	for ball in Balls:
		ball.queue_free()


func _on_lilmenu2_continuee():
	$lilmenu2/AnimationPlayer.play("Out")
	$BallTimer.start()


func _on_CoinBar_CoinYay():
	coins +=1


func _on_endMenu2_home():
	GameData.loadTotalCoins()
	if !Death:
		GameData.totalcoins+=coins
	Transition.FadeTo("res://Scenes/Main.tscn")


func _on_lilmenu2_settings():
	$SettingsMenu/AnimationPlayer.play("In")


func _on_SettingsMenu_SoundOn():
	$AudioStreamPlayer.play()


func _on_SettingsMenu_SoundOff():
	$AudioStreamPlayer.stop()


func _on_RotationDirectionTimer_timeout():
	$RotationDirectionTimer.wait_time=randi()%20 +5
	$MessageLabel.text="Rotate the other way!"
	$AnimationPlayer.play("ShowMessage")
	emit_signal("changeHexagonDirection")


func _on_Hexagon_power():
	var Balls = get_tree().get_nodes_in_group("Balls")
	Balls[0].queue_free()
	
	#aqui va lo que pasa cuando ganas el poder
	$MessageLabel.text="POWER UP!!!"
	$AnimationPlayer.play("ShowMessage")
