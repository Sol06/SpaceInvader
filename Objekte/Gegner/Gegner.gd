extends Area2D

signal gegner_gestorben

#Deklariert die Geschwindigkeit des Spielers.
export (int) var speed = 150

#Deklariert die Menge an Leben, die der Spieler hat.
var leben = 2

#Gibt an, mit welcher Geschwindigkeit (Zeit)der Spieler sich an der y-Achse nach unten bewegt.
func _physics_process(delta):
	global_position.y += speed * delta

#Gibt an, wann der Spieler stirbt.
func take_damage(damage):
	leben -= damage
	if leben <= 0:
		print("Gegner: bin weg")
		emit_signal("gegner_gestorben")
		queue_free()


func _on_Gegner_area_entered(area):
	print("Gegner: getroffen")
	if area is Spieler:
		take_damage(2)
	if area is Geschoss:
		take_damage(1)
