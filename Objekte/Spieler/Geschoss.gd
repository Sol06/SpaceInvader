extends Area2D

var geschossSpeed = 450

var geschossSchaden = 1

func _physics_process(delta):
	position -= transform.y * geschossSpeed * delta


func _on_Laser_body_entered(body):
	print("getroffen")
