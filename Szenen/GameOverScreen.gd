extends CanvasLayer

signal restart_triggered

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Quit_Button_pressed():
	#get_tree().change_scene()
	pass

func _on_Restart_Button_pressed():
	print("restart!!!!")
	emit_signal("restart_triggered")

func show_me():
	print("Zeig mich")
	$MarginContainer.show()
	
func hide_me():
	print("Verstecke mich")
	$MarginContainer.hide()
