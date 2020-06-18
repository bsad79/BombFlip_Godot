extends RichTextLabel

var sec = 30
var minu = 01


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sec < 01:
		minu -= 01
		sec = 59
		pass
		
	set_text(str(minu)+":"+str(sec))
	pass


func add(point):
	sec += point
	pass


func _on_Timer_timeout():
	sec -= 1
	pass
