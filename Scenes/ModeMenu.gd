extends Node2D

signal challenges
signal hard
signal extreme
signal store
signal backk

func Visibility():
	$TextureRect.visible = !$TextureRect.visible
	$Modes.visible = !$Modes.visible
	$Store.visible = !$Store.visible
	$Challenges.visible = !$Challenges.visible
	$Extreme.visible = !$Extreme.visible
	$Hard.visible = !$Hard.visible
	$backButton.visible = !$backButton.visible

func _on_GameButtons_menu():
	$AnimationPlayer.play("In")


func _on_Challenges_button_down():
	$Challenges/Label.get_font("font").size= 110
func _on_Challenges_button_up():
	$Challenges/Label.get_font("font").size= 120
	emit_signal("challenges")

func _on_Store_button_down():
	$Store/Label.get_font("font").size= 110
func _on_Store_button_up():
	$Store/Label.get_font("font").size= 120
	emit_signal("store")

func _on_Extreme_button_down():
	$Extreme/Label.get_font("font").size= 110
func _on_Extreme_button_up():
	$Extreme/Label.get_font("font").size= 120
	emit_signal("extreme")

func _on_Hard_button_down():
	$Hard/Label.get_font("font").size= 110
func _on_Hard_button_up():
	$Hard/Label.get_font("font").size= 120
	emit_signal("hard")

func _on_backButton_pressed():
	$AnimationPlayer.play("Out")
	emit_signal("backk")
