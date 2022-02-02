extends Node2D

var spawn_positionen = null


#Platziert einen Gegner auf einer der beliebigen Positionen.
func spawn_gegner():
	var index = randi() % spawn_positionen.size()
	var gegner = preload("res://Objekte/Gegner/Gegner.tscn").instance()
	gegner.global_position = spawn_positionen[index].global_position
	add_child(gegner)
	print("spawning...")


#Nach Ablauf des Timers wird ein weitere gegner platziert.
func do_it_after_timeout():
	print("make things ready...")
	print("timeout")
	randomize()
	spawn_positionen = $SpawnPositionen.get_children()
	spawn_gegner()
