class_name Spieler extends Area2D

signal schiesse_laser(location)


signal binTot

onready var GeschossPosition = $GeschossPosition

#Deklariert die Geschwindigkeit des Spielers.
export (int) var speed = 700
var screen_size

#Deklariert die Menge an Leben, die der Spieler hat.
var leben = 3
var Geschoss = preload("res://Objekte/Spieler/Geschoss.tscn")

var velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size

#Spieler Bewegung durch Tasteneingabe.
func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	velocity = velocity.normalized() * speed

	position += velocity * delta
	position.x = clamp(position.x, 15, screen_size.x)
	position.y = clamp(position.y, 15, screen_size.y)

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()
	
#Der Spieler feuert einen Laserschuss.
func shoot():
	emit_signal("schiesse_laser", GeschossPosition.global_position)
	
#Gibt an, wann der Spieler zerstört wird.
func take_damage(damage):
	leben -= damage
	if leben <= 0:
		print("Spieler: bin tot")
		emit_signal("binTot")
		queue_free()

func _on_Spieler_area_entered(area):
	print("Spieler getroffen")
	if area.is_in_group("gegner"):
		take_damage(1)
