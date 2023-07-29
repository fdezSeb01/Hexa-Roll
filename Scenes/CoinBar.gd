extends Control
signal death
signal CoinYay
var paused = false
var powerUp=false
var powerUpCont=0
func _process(delta):
	if $TextureProgress.value > 995:
		$Sprite/AnimationPlayer.play("Full")
		emit_signal("CoinYay")
		$TextureProgress.value = 200

func _on_Hexagon_tap():
	$TextureProgress.value +=35

func _on_Hexagon_collisionOnCenter():
	$TextureProgress.value -=get_parent().CoinBarOnCenterCollisionDecrease

func _on_Hexagon_pointCollision():
	$TextureProgress.value += 325

func _on_Timer_timeout():
	if powerUp and powerUpCont<100:
		$TextureProgress.value +=35
		powerUpCont+=1
		return
	if $TextureProgress.value < get_parent().CoinBarDecreaseVelocity or paused: return
	$TextureProgress.value -=get_parent().CoinBarDecreaseVelocity

func _on_GameButtons_pause():
	paused = true

func _on_lilmenu2_continuee():
	paused = false


func _on_TextureProgress_value_changed(value):
	if $TextureProgress.value < get_parent().CoinBarDecreaseVelocity:
		paused= true
		emit_signal("death")


func _on_Hexagon_power():
	powerUpCont=0
	powerUp=true
