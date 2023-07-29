extends CanvasLayer
var path
func FadeTo(scn_path):
	path = scn_path
	$AnimationPlayer.play("Fade")

func change_scene():
	if path != "":
		get_tree().change_scene(path)

func Visibility():
	$TextureRect.visible = !$TextureRect.visible
