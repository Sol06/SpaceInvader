extends Node

#Start & Stopp 
var Laser = preload("res://Objekte/Spieler/Geschoss.tscn")

var score = 0

#func leben():
#	leben -= 1
#	$Leben.text = "LEBEN: " + str(leben)

func score():
	score += 10
	$Score.text = "MITARBEITER ABGEWORBEN: " + str(score)


func _on_Spieler_schiesse_laser(location):
	var l = Laser.instance()
	l.global_position = location
	add_child(l)

func game_over():
	pass
