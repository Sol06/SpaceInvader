extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Quit_Button_pressed():
	get_tree().change_scene()

func _on_Restart_Button_pressed():
	get_tree().reload_current_scene()
