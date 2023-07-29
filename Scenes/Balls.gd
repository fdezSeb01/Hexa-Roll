extends RigidBody2D

var BallArray = ["Pink","Green","Blue","Red","Brown","Yellow","ToadPower"]
enum {SMILEY,SAD,ASTRO,DUCK,EYE,ANGRY,FACKAF,SPIRAL,SPIRALWOW,TEDDY,TURTLE}


func _process(delta):
	$Skinss.rotation_degrees+=100*delta
	$ToadPower.rotation_degrees+=100*delta

func _ready():
	randomize()
	var r = randi() % (BallArray.size() -1)
	var Powerchance =randi() % 25 #1 in 25 chance de power up
	if (Powerchance==4 and get_parent().mode=="hard"):
		r=6
	$AnimatedSprite.animation = BallArray[r]
	setVisible(GameData.skin)
	match r:
		0:
			collision_mask = 4
		1:
			collision_mask = 16
		2:
			collision_mask = 8
		3:
			collision_mask = 1
		4:
			collision_mask = 2
		5:
			collision_mask = 32
		6:
			collision_mask = 64
			$AnimatedSprite.playing=true
			$ToadPower.visible=true
			$Skinss.visible=false

func setVisible(skin):
	match skin:
		SMILEY:
			$Skinss/Smile.visible=true
		SAD:
			$Skinss/Sad.visible=true
		ASTRO:
			$Skinss/Astro.visible=true
		DUCK:
			$Skinss/Duck.visible=true
		EYE:
			$Skinss/Eye.visible=true
		ANGRY:
			$Skinss/Angry.visible=true
		FACKAF:
			$Skinss/Fackaf.visible=true
		SPIRAL:
			$Skinss/Spiral.visible=true
		SPIRALWOW:
			$Skinss/Spiralwow.visible=true
		TEDDY:
			$Skinss/Teddy.visible=true
		TURTLE:
			$Skinss/Turtle.visible=true
