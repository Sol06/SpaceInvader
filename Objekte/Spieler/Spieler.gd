class_name Spieler extends KinematicBody2D

#Deklariert die Geschwindigkeit des Spielers.
export (int) var speed = 700

#Deklariert die Menge an Leben, die der Spieler hat.
var leben = 3
var Geschoss = preload("res://Objekte/Spieler/Geschoss.tscn")

var velocity = Vector2()

#Spieler Bewegung durch Tasteneingabe.
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("shoot"):
		shoot()
	velocity = velocity.normalized() * speed


func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	
#Der Spieler feuert einen Laserschuss.
func shoot():
	#var pos = 
	print("Schiessen...")
	var pos = get_position()
	print(pos)
	var geschoss = Geschoss.instance()
	owner.add_child(geschoss)
	geschoss.transform = global_transform
	

#Gibt an, wann der Spieler zerstört wird.
func hit(damage):
	leben -= damage
	if leben <= 0:
		queue_free()
