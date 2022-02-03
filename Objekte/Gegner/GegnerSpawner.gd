extends Node2D

signal add_score

var spawn_positionen = null


#Platziert einen Gegner auf einer der beliebigen Positionen.
func spawn_gegner():
	var index = randi() % spawn_positionen.size()
	var gegner = preload("res://Objekte/Gegner/Gegner.tscn").instance()
	gegner.global_position = spawn_positionen[index].global_position
	gegner.connect("gegner_gestorben", get_tree().current_scene, "score")
	add_child(gegner)
	

#Nach Ablauf des Timers wird ein weitere gegner platziert.
func do_it_after_timeout():
	#print("timeout")
	randomize()
	spawn_positionen = $SpawnPositionen.get_children()
	spawn_gegner()

func gegener_gestorben():
	emit_signal("add_score")
