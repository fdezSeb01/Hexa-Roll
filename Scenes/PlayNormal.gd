extends Node2D
export (PackedScene) var Ballscene
var BallVelocity = 100
var score =0
var coins =0
var direction
var CoinBarDecreaseVelocity
var CoinBarOnCenterCollisionDecrease
var Death=false
signal pointUp
var mode="normal"

func _ready():
	randomize()
	$GameButtons/MenuButton.visible = false
	$GameButtons/SettingsButton.visible=false
	$GameButtons/PauseButton.visible = true
	if GameData.soundonoff==true: $AudioStreamPlayer.play()
	CoinBarDecreaseVelocity=2
	CoinBarOnCenterCollisionDecrease=600
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
	if score < 5: BallVelocity = 100
	elif score > 5 and score < 10: 
		BallVelocity = 125
		$BallTimer.wait_time = 4
	elif score > 10 and score < 14: 
		BallVelocity = 150
		$BallTimer.wait_time = 3.5
	elif score >14 and score< 18: 
		BallVelocity = 195
		$BallTimer.wait_time = 1.8
	else:
		BallVelocity=225
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
