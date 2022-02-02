extends Area2D

var geschossSpeed = 450

var geschossSchaden = 1

func _physics_process(delta):
	position -= transform.y * geschossSpeed * delta
