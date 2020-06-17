extends GridContainer

func _ready():
	get_parent().get_node("Tutorial").visible = false
	pass


#func _process(delta):
	#pass

func _on_Classic_Mode_button_up():
	get_parent().get_parent().get_node(".").gameMode = "classic"
	get_parent().get_parent().get_node("Game/Main").valueClear()
	get_parent().get_parent().get_node("Game").visible = true
	pass


func _on_Timer_Mode_button_up():
	get_parent().get_parent().get_node(".").gameMode = "timer"
	get_parent().get_parent().get_node("Game/Main").valueClear()
	get_parent().get_parent().get_node("Game").visible = true
	pass


func _on_Tutorial_button_up():
	get_parent().get_node("Tutorial").visible = true
	pass


func _on_Close_button_up():
	get_parent().get_node("Tutorial").visible = false
	pass
