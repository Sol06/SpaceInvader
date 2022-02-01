extends Node2D

var spawn_positionen = null

#Lädt die Szene des Gegners.


#Platziert einen Gegner.
func ready():
	randomize()
	spawn_positionen = $SpawnPositionen.get_children()
	
#Platziert einen Gegner auf einer der beliebigen Positionen.
func spawn_gegner():
	var index = randi() % spawn_positionen.size()
	var gegner = preload("res://Objekte/Gegner/Gegner.tscn").instance()
	gegner.global_position = spawn_positionen[index].global_position
	add_child(gegner)
		
#Nach Ablauf des Timers wird ein weitere gegner platziert.
func _on_SpawnTimer_timeout():
	spawn_gegner()
