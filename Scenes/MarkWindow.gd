extends Panel

var markIcon
var markBoxV = false
var markType

func _ready():
	markIcon = get_parent().get_node("Main/Mark/TextureRect")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func textureReset():
	markIcon.texture = load("res://Images/Icons/pencil.png")
	markBoxV = false
	pass
	
func mark(btn):
	var markPlace = get_parent().get_node("Main/"+btn+"/MarkContainer")
	if markType == 0:
		if markPlace.get_child(0).texture == null:
			markPlace.get_child(0).texture = load("res://Images/Icons/MarkBomb.png")
			pass
		else:
			markPlace.get_child(0).texture = null
			pass
		pass
	elif markType == 1:
		if markPlace.get_child(1).texture == null:
			markPlace.get_child(1).texture = load("res://Images/Numbers/Mark1.png")
			pass
		else:
			markPlace.get_child(1).texture = null
			pass
		pass
	elif markType == 2:
		if markPlace.get_child(2).texture == null:
			markPlace.get_child(2).texture = load("res://Images/Numbers/Mark2.png")
			pass
		else:
			markPlace.get_child(2).texture = null
			pass
		pass
	elif markType == 3:
		if markPlace.get_child(3).texture == null:
			markPlace.get_child(3).texture = load("res://Images/Numbers/Mark3.png")
			pass
		else:
			markPlace.get_child(3).texture = null
			pass
		pass
	pass

func _on_Close_button_up():
	get_parent().get_node("MarkWindow").visible = false
	pass


func _on_BombOpt_button_up():
	get_parent().get_node("MarkWindow").visible = false
	if markBoxV == false:
		markIcon.texture = load("res://Images/Icons/MarkBomb.png")
		markType = 0
		markBoxV = true
		pass
	else:
		textureReset()
		pass
	pass


func _on_OneOpt_button_up():
	get_parent().get_node("MarkWindow").visible = false
	if markBoxV == false:
		markIcon.texture = load("res://Images/Numbers/Mark1.png")
		markType = 1
		markBoxV = true
		pass
	else:
		textureReset()
		pass
	pass


func _on_TwoOpt_button_up():
	get_parent().get_node("MarkWindow").visible = false
	if markBoxV == false:
		markIcon.texture = load("res://Images/Numbers/Mark2.png")
		markType = 2
		markBoxV = true
		pass
	else:
		textureReset()
		pass
	pass


func _on_ThreeOpt_button_up():
	get_parent().get_node("MarkWindow").visible = false
	if markBoxV == false:
		markIcon.texture = load("res://Images/Numbers/Mark3.png")
		markType = 3
		markBoxV = true
		pass
	else:
		textureReset()
		pass
	pass
