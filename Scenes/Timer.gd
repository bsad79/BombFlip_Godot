extends RichTextLabel

var sec = 30
var minu = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sec < 0:
		minu -= 1
		sec = 59
		pass
	
	if sec >9:
		set_text(str(minu)+":"+str(sec))
		pass
	else:
		set_text(str(minu)+":0"+str(sec))
		pass
	pass


func add(point):
	sec += point
	if sec > 59:
		minu += 1
		sec = 0
		pass
	pass
	

func addBonus(table):
	if table == "5x5/":
		sec += 10
		pass
	elif table == "7x7/":
		sec += 20
		pass
	elif table == "9x9/":
		sec += 30
		pass
	if sec > 59:
		minu += 1
		sec = 0
		pass
	pass


func _on_Timer_timeout():
	sec -= 1
	pass
