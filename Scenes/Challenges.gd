extends Node2D


func _ready():
	GameData.loadChallengesCompleted()
	for i in range(GameData.challengesCompleted+1):
		if i==15: break
		get_node("Control").get_child(i).disabled=false
		get_node("Control").get_child(i).get_node("Label").modulate="#ffffff"


func _on_TextureButton1_button_down():
	$Control/TextureButton1/Label.get_font("font").size= 90

func _on_TextureButton1_button_up():
	$Control/TextureButton1/Label.get_font("font").size= 100
	GameData.challengeNumber=1
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton2_button_down():
	$Control/TextureButton2/Label.get_font("font").size= 90


func _on_TextureButton2_button_up():
	$Control/TextureButton2/Label.get_font("font").size= 100
	GameData.challengeNumber=2
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton3_button_down():
	$Control/TextureButton3/Label.get_font("font").size= 90


func _on_TextureButton3_button_up():
	$Control/TextureButton3/Label.get_font("font").size= 100
	GameData.challengeNumber=3
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton4_button_down():
	$Control/TextureButton4/Label.get_font("font").size= 90


func _on_TextureButton4_button_up():
	$Control/TextureButton4/Label.get_font("font").size= 100
	GameData.challengeNumber=4
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton5_button_down():
	$Control/TextureButton5/Label.get_font("font").size= 90


func _on_TextureButton5_button_up():
	$Control/TextureButton5/Label.get_font("font").size= 100
	GameData.challengeNumber=5
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton6_button_down():
	$Control/TextureButton6/Label.get_font("font").size= 90


func _on_TextureButton6_button_up():
	$Control/TextureButton6/Label.get_font("font").size= 100
	GameData.challengeNumber=6
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton7_button_down():
	$Control/TextureButton7/Label.get_font("font").size= 90


func _on_TextureButton7_button_up():
	$Control/TextureButton7/Label.get_font("font").size= 100
	GameData.challengeNumber=7
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton8_button_down():
	$Control/TextureButton8/Label.get_font("font").size= 90


func _on_TextureButton8_button_up():
	$Control/TextureButton8/Label.get_font("font").size= 100
	GameData.challengeNumber=8
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton9_button_down():
	$Control/TextureButton9/Label.get_font("font").size= 90


func _on_TextureButton9_button_up():
	$Control/TextureButton9/Label.get_font("font").size= 100
	GameData.challengeNumber=9
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton10_button_down():
	$Control/TextureButton10/Label.get_font("font").size= 90


func _on_TextureButton10_button_up():
	$Control/TextureButton10/Label.get_font("font").size= 100
	GameData.challengeNumber=10
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton11_button_down():
	$Control/TextureButton11/Label.get_font("font").size= 90


func _on_TextureButton11_button_up():
	$Control/TextureButton11/Label.get_font("font").size= 100
	GameData.challengeNumber=11
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton12_button_down():
	$Control/TextureButton12/Label.get_font("font").size= 90


func _on_TextureButton12_button_up():
	$Control/TextureButton12/Label.get_font("font").size= 100
	GameData.challengeNumber=12
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton13_button_down():
	$Control/TextureButton13/Label.get_font("font").size= 90


func _on_TextureButton13_button_up():
	$Control/TextureButton13/Label.get_font("font").size= 100
	GameData.challengeNumber=13
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton14_button_down():
	$Control/TextureButton14/Label.get_font("font").size= 90


func _on_TextureButton14_button_up():
	$Control/TextureButton14/Label.get_font("font").size= 100
	GameData.challengeNumber=14
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_TextureButton15_button_down():
	$Control/TextureButton15/Label.get_font("font").size= 90


func _on_TextureButton15_button_up():
	$Control/TextureButton15/Label.get_font("font").size= 100
	GameData.challengeNumber=15
	Transition.FadeTo("res://Scenes/PlayChallenge.tscn")


func _on_BackButton_pressed():
	Transition.FadeTo("res://Scenes/Main.tscn")
