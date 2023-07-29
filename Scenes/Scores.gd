extends Control
var score =0
func _on_PlayNormal_pointUp():
	score +=1
	$InGameScore.text = str(score)


func _on_PlayHard_pointUp():
	score +=1
	$InGameScore.text = str(score)


func _on_PlayChallenge_pointUp():
	score +=1
	$InGameScore.text = str(score)
