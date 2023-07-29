extends Node2D #maso sirve, se escapa la bola, si se borra asegurar de apagar layer 10 en partes hexagono
#node_tree order: 0,red,brown,pink,blue,green,yellow,7,center
var BallArray = ["Pink","Green","Blue","Red","Brown","Yellow"]
var Ballinside=false
var direction
var prevMask
var BallColor

func _ready():
	direction=-PI/2
	randomize()
	$Balls.set_linear_velocity(Vector2(100,0).rotated(direction))





func _on_Hexagon_collisionOnCenter():
	direction+=PI
	$Balls.set_linear_velocity(Vector2(150,0).rotated(direction))


func _on_Hexagon_pointCollision():
	if Ballinside==false:
		print("Ball inside")
		Ballinside=true
		prevMask=$Balls.collision_mask
		$Balls.collision_mask=1024
		$Hexagon.get_child(getHexaChild()).set_collision_layer_bit(10,false)
	else:
		direction+=PI+PI/3 + ((randi()%5)/20)
		$Balls.set_linear_velocity(Vector2(150,0).rotated(direction))
		var vector = $Balls.get_linear_velocity()
		print(vector)

func getHexaChild():
	match prevMask:
		1:
			return 1
		2:
			return 2
		4:
			return 3
		8:
			return 4
		16:
			return 5
		32:
			return 6

























