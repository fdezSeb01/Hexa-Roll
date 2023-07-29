extends Node2D
var counter
var girando= false
var paused = false
var ended = false
var degreeOfRotation=15
signal collisionOnCenter
signal pointCollision
signal tap
signal power

func _input(event):
	if event is InputEventScreenTouch and event.pressed and !girando and !paused and !ended:   #Solo 1 vez
		counter=0
		girando = true
		$Timer.start()
		emit_signal("tap")

func _on_Timer_timeout():
	rotation_degrees+=degreeOfRotation
	counter+=1
	if counter < 4:
		$Timer.start()
	else:
		girando=false
		if (int(rotation_degrees)%60!=0):
			rotation_degrees-=int(rotation_degrees)%60
		return


func _on_body_entered(body):
	emit_signal("pointCollision")

func _on_CenterArea_body_entered(body):
	if(body.collision_mask==64):
		emit_signal("power")
		return
	emit_signal("collisionOnCenter")


func _on_GameButtons_pause():
	paused = true


func _on_lilmenu2_continuee():
	paused = false


func _on_death():
	ended = true


func _on_endMenu2_home():
	ended = false


func _on_ModeMenu_backk():
	paused=false


func _on_PlayHard_changeHexagonDirection():
	degreeOfRotation*=-1

