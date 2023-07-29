extends Node2D
signal backk
signal SoundOff
signal SoundOn
func _ready():
	GameData.loadSoundOnOff()
#	match GameData.soundonoff:
#		true:
#			$SoundButtonOn.visible=true
#			$SoundButtonOff.visible=false
#		false:
#			$SoundButtonOn.visible=false
#			$SoundButtonOff.visible=true
func _on_SoundButtonOn_pressed():
	$SoundButtonOn.visible=false
	$SoundButtonOff.visible=true
	GameData.soundonoff = false
	emit_signal("SoundOff")


func _on_SoundButtonOff_pressed():
	$SoundButtonOn.visible=true
	$SoundButtonOff.visible=false
	GameData.soundonoff = true
	emit_signal("SoundOn")

func Visibility():
	$TextureRect.visible = !$TextureRect.visible
	$GoBackButton.visible = !$GoBackButton.visible
	match $TextureRect.visible:
		true:
			match GameData.soundonoff:
				true:
					$SoundButtonOn.visible=true
					$SoundButtonOff.visible=false
				false:
					$SoundButtonOn.visible=false
					$SoundButtonOff.visible=true
		false:
			$SoundButtonOn.visible=false
			$SoundButtonOff.visible=false

func _on_GoBackButton_pressed():
	$AnimationPlayer.play("Out")
	emit_signal("backk")
