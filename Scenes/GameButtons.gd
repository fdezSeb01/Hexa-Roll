extends Control
signal settings
signal menu
signal pause


func _on_PauseButton_pressed():
	emit_signal("pause")

func _on_SettingsButton_pressed():
	emit_signal("settings")

func _on_MenuButton_pressed():
	emit_signal("menu")
