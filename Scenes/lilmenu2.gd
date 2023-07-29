extends Node2D

signal settings
signal continuee
signal home


func Visibility():
	$ContinueButton.visible = !$ContinueButton.visible
	$SettingsButton.visible = !$SettingsButton.visible
	$HomeButton.visible = !$HomeButton.visible
	$TextureRect.visible = !$TextureRect.visible
func _on_TextureButton_pressed():
	emit_signal("continuee")

func _on_TextureButton2_pressed():
	emit_signal("settings")

func _on_TextureButton3_pressed():
	emit_signal("home")
