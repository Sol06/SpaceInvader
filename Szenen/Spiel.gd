extends Node

var SCORE = 0
var LEBEN = 1

var score = SCORE
var leben = LEBEN

func _ready():
	game_start()

func score():
	score += 10
	$Score.text = "MITARBEITER ABGEWORBEN: " + str(score)

func game_start():
	$Leben.text = "PANZERUNG: " + str(leben)
	$Score.text = "MITARBEITER ABGEWORBEN: " + str(score)
	$GameOverScreen.hide_me()

func game_over():
	print("Spiel ist rum!!")
	remove_child($GegnerSpawner)
	$GameOverScreen.show_me()


func _on_Spieler_istGetroffen():
	leben -= 1
	$Leben.text = "PANZERUNG: " + str(leben)
	if (leben <= 0):
		game_over()


func game_restart():
	# GegnerSpawner erneut instanziieren
	# Spieler erneut instanziieren
	get_tree().reload_current_scene()
	# score / leben neu setzen
	leben = LEBEN
	score = SCORE
	print ("neustart")
	game_start() # ausführen
