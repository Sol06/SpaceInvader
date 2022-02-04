class_name Spieler extends Area2D

signal schiesse_laser(location)

var Laser = preload("res://Objekte/Spieler/Geschoss.tscn")

signal binGetroffen

onready var GeschossPosition = $GeschossPosition

#Deklariert die Geschwindigkeit des Spielers.
export (int) var speed = 700
var screen_size

#Deklariert die Menge an Leben, die der Spieler hat.
var leben = 3

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
	position.x = clamp(position.x, 15, screen_size.x-34)
	position.y = clamp(position.y, 15, screen_size.y-34)

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()
	
#Der Spieler feuert einen Laserschuss.
func shoot():
	var location = GeschossPosition.global_position
	#emit_signal("schiesse_laser", GeschossPosition.global_position)
	var l = Laser.instance()
	l.global_position = location
	owner.add_child(l)
	
#Gibt an, wann der Spieler zerstört wird.
func take_damage(damage):
	leben -= damage
	emit_signal("binGetroffen")
	if leben <= 0:
		print("Spieler: bin tot")
		queue_free()

func _on_Spieler_area_entered(area):
	print("Spieler getroffen")
	if area.is_in_group("gegner"):
		take_damage(1)
