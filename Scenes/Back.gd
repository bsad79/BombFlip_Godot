extends Button

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_button_up():
	get_parent().get_parent().get_node("Main").difficultLvl = 1
	if get_parent().get_parent().get_parent().get_node(".").gameMode == "timer":
		get_parent().get_node("Score/Timer").sec = 30
		get_parent().get_node("Score/Timer").minu = 1
		get_parent().get_node("Score/Timer/Timer").stop()
		pass
	get_parent().get_parent().get_parent().get_node("Game").visible = false
	pass
