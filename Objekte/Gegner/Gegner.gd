extends Area2D

#Deklariert die Geschwindigkeit des Spielers.
export (int) var speed = 150

#Deklariert die Menge an Leben, die der Spieler hat.
var leben = 1

#Gibt an, mit welcher Geschwindigkeit (Zeit)der Spieler sich an der y-Achse nach unten bewegt.
func _physics_process(delta):
	global_position.y += speed * delta

#Gibt an, wann der Spieler stirbt.
func hit(damage):
	leben -= damage
	if leben <= 0:
		queue_free()
