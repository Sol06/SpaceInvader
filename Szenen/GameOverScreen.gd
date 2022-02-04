extends CanvasLayer

signal restart_triggered

var ich_werde_angezeigt = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("verlasse"):
		get_tree().quit()
	if event.is_action_pressed("restart"):
		if ich_werde_angezeigt:
			_on_Restart_Button_pressed()

func _on_Quit_Button_pressed():
	#get_tree().change_scene()
	pass

func _on_Restart_Button_pressed():
	print("restart!!!!")
	emit_signal("restart_triggered")

func show_me():
	print("Zeig mich")
	ich_werde_angezeigt = true
	$MarginContainer.show()
	
func hide_me():
	print("Verstecke mich")
	ich_werde_angezeigt = false
	$MarginContainer.hide()
