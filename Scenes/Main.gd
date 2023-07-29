extends Node2D
func _ready():
	load("res://Scenes/PlayNormal.tscn")
	load("res://Scenes/Store.tscn")
	$HighScore.text = str(GameData.bestscore)
	if GameData.soundonoff==true: $AudioStreamPlayer.play()

func _on_PlayButton_pressed():
	Transition.FadeTo("res://Scenes/PlayNormal.tscn")

func _on_GameButtons_settings():
	$InfoSettingsMenu/AnimationPlayer.play("In")

func _on_InfoSettingsMenu_SoundOn():
	$AudioStreamPlayer.play()

func _on_InfoSettingsMenu_SoundOff():
	$AudioStreamPlayer.stop()

func _on_ModeMenu_store():
	Transition.FadeTo("res://Scenes/StoreNew.tscn")

func _on_ModeMenu_hard():
	Transition.FadeTo("res://Scenes/PlayHard.tscn")


func _on_ModeMenu_challenges():
	Transition.FadeTo("res://Scenes/Challenges.tscn")
