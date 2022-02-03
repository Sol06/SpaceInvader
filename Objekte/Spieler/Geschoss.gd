class_name Geschoss extends Area2D

var geschossSpeed = 450

var geschossSchaden = 1

func _physics_process(delta):
	global_position.y += -geschossSpeed * delta
	
	
func _on_Laser_area_entered(area):
	#if area.is_in_group("gegner"):
	#	area.take_damage(1)
	queue_free()
