extends GridContainer

var difficultLvl
var grid
var cardsF = 0
var score = 0
var Zcount = 0
var OneCount = 0
var TwoCount = 0
var ThreeCount = 0
var cont = 0
var rowCount = 0
var colCount = 1
var sum = 0
var n
var btn0
var btn1
var btn2 = null
var btn3 = null
var btnSfx
var btnMusic
var sfxChannel
var musicChannel

func _ready():
	sfxChannel = get_parent().get_parent().get_node("sfx")
	musicChannel = get_parent().get_parent().get_node("music")
	btnSfx = get_parent().get_parent().get_node("Menu/Main/Sfx/Sfx")
	btnMusic = get_parent().get_parent().get_node("Menu/Main/Music/Music")
	if btnMusic.is_pressed() == true:
		#musicChannel.stream = load("res://Sounds/Explosion.wav")
		pass
	get_parent().get_node("MarkWindow").visible = false
	difficultLvl = 1
	difficultCheck()
	valueSet()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func difficultCheck():
	print("dif: "+str(difficultLvl))
	if(difficultLvl < 5):
		grid = 6
		pass
	if(difficultLvl > 4 && difficultLvl < 7):
		grid = 8
		pass
	if(difficultLvl > 6):
		grid = 10
		pass
	pass


func sfx(type):
	if btnSfx.is_pressed() == true:
		if type == btn0:
			sfxChannel.stream = load("res://Sounds/Explosion.wav")
			pass
		else:
			sfxChannel.stream = load("res://Sounds/Flip.wav")
			pass
		pass
	pass


func valueCalc(Zcount):
	randomize()
	var value
	if(difficultLvl == 1):
		if(Zcount == 1):
			value = floor(randf() * 1.2) + 1
			pass
		else:
			value = floor(randf() * 2.2)
			pass
		pass
	if(difficultLvl == 2):
		if(Zcount == 1):
			value = floor(randf() * 1.5) + 1
			pass
		else:
			value = floor(randf() * 2.5)
			pass
		pass
	if(difficultLvl == 3):
		if(Zcount == 2):
			value = floor(randf() * 2.2) + 1
			pass
		else:
			value = floor(randf() * 3.2)
			pass
		pass
	if(difficultLvl == 4):
		if(Zcount == 3):
			value = floor(randf() * 2.5) + 1
			pass
		else:
			value = floor(randf() * 3.5)
			pass
		pass
	if(difficultLvl == 5):
		if(Zcount == 5):
			value = floor(randf() * 2.5) + 1
			pass
		else:
			value = floor(randf() * 3.5)
			pass
		pass
	if(difficultLvl == 6):
		if(Zcount < 4):
			value = floor(randf() * 1.5)
			pass
		else:
			value = floor(randf() * 3.5)
			pass
		pass
	if(difficultLvl == 7):
		if(Zcount == 7):
			value = floor(randf() * 2.5) + 1
			pass
		else:
			value = floor(randf() * 3.5)
			pass
		pass
	if(difficultLvl == 8):
		if(Zcount == 8):
			value = floor(randf() * 1.2) + 2
			pass
		else:
			value = floor(randf() * 3.5)
			if(value == 1):
				value = 0;
				pass
			pass
		pass
		pass
	if(difficultLvl == 9):
		value = floor(randf() * 3.5)
		if(value == 1):
			value = 0;
			pass
		pass
	if(difficultLvl == 10):
		value = floor(randf() * 3.5)
		if(value == 1):
			value = 0;
			pass
		pass
	return value;
	pass


func valueSet():
	var Max = (grid-1)*(grid-1)
	for n in range(1,Max+1):
		var value = valueCalc(Zcount)
		var btn = get_node("Button"+str(n)+"/Panel/TextureRect")
		if(value == 0):
			Zcount += 1
			btn.texture = load("res://Images/Icons/bomb.png")
			btn0 = btn.texture
			pass
		else:
			btn.texture = load("res://Images/Numbers/"+ str(value) +".png")
			if(value == 1):
				OneCount += 1
				sum += value
				btn1 = btn.texture
				pass
			elif(value == 2):
				TwoCount += 1
				sum += value
				btn2 = btn.texture
				pass
			elif(value == 3):
				ThreeCount += 1
				sum += value
				btn3 = btn.texture
				pass
			pass
		
		get_node("Button"+str(n)+"/Panel").visible = false
		btn.set_stretch_mode(6)
		cont += 1
		if(cont == grid-1):
			rowCount += 1
			rowAuxSet(sum)
			cont = 0
			sum = 0
			Zcount = 0
			pass
		pass
	colAuxSet()
	cardCheck()
	pass


func rowAuxSet(sum):
	var panelP = get_node("Panel"+str(rowCount)+"/GridContainer/Points")
	var panelB = get_node("Panel"+str(rowCount)+"/GridContainer/GridContainer/BombQnt")
	panelP.set_text(str(sum))
	panelB.set_text(str(Zcount))
	pass


func colAuxSet():
	n = 0
	var Max = (grid-1)*(grid-1)
	for i in range(1,6):
		for n in range(1,Max+1):
			if(n == colCount or n == colCount + grid-1 or
			n == colCount + (2*(grid-1)) or n == colCount + (3*(grid-1)) or
			n == colCount + (4*(grid-1))):
				var btn = get_node("Button"+str(n)+"/Panel/TextureRect")
				if(btn.texture == btn0):
					Zcount += 1
					pass
				elif(btn.texture == btn1):
					OneCount += 1
					sum += 1
					pass
				elif(btn.texture == btn2):
					TwoCount += 1
					sum += 2
					pass
				elif(btn.texture == btn3):
					ThreeCount += 1
					sum += 3
					pass
				pass
			
			if(n == Max):
				var panelP = get_node("Panel"+str(colCount+5)+"/GridContainer/Points")
				var panelB = get_node("Panel"+str(colCount+5)+"/GridContainer/GridContainer/BombQnt")
				panelP.set_text(str(sum))
				panelB.set_text(str(Zcount))
				colCount += 1
				sum = 0
				Zcount = 0
				pass
			pass
		n = 0
		pass
	pass


func cardCheck():
	TwoCount = 0
	ThreeCount = 0
	var Max = (grid-1)*(grid-1)
	for n in range(1,Max+1):
		var btn = get_node("Button"+str(n)+"/Panel/TextureRect")
		if(btn.texture == btn2):
			TwoCount += 1
			pass
		elif(btn.texture == btn3):
			ThreeCount += 1
			pass
		pass
	print("two: "+str(TwoCount))
	print("three: "+str(ThreeCount))
	pass


func ScoreUpdate():
	get_parent().get_node("Top/Placar_Timer").text = str(score)
	if ThreeCount == 0 && TwoCount == 0:
		difficultLvl += 1
		difficultCheck()
		valueClear()
		pass
	pass


func flip():
	var btn = get_focus_owner()
	var mark = btn.get_child(0)
	var texture = btn.get_child(1).get_child(0).texture
	if get_parent().get_node("MarkWindow").markBoxV == true:
		get_parent().get_node("MarkWindow").mark(btn.get_name())
		pass
	else:
		btn.get_child(1).visible = true
		if texture == btn0:
			sfx(texture)
			score = 0
			cardsF = 0
			difficultLvl = 1
			difficultCheck()
			valueClear()
			pass
		else:
			sfx(texture)
			pass
		if cardsF == 0:
			cardsF += 1
			if texture == btn1:
				score += 1
				pass
			elif texture == btn2:
				score += 2
				TwoCount -= 1
				pass
			elif texture == btn3:
				score += 3
				ThreeCount -= 1
				pass
			pass
		else:
			cardsF += 1
			if texture == btn1:
				score *= 1
				pass
			elif texture == btn2:
				score += 2
				TwoCount -= 1
				pass
			elif texture == btn3:
				score += 3
				ThreeCount -= 1
				pass
			pass
		sfxChannel.play()
		ScoreUpdate()
		pass
	pass


func valueClear():
	rowCount = 0
	colCount = 1
	Zcount = 0
	OneCount = 0
	TwoCount = 0
	ThreeCount = 0
	sum = 0
	var Max = (grid-1)*(grid-1)
	for n in range(1,Max+1):
		var btn = get_node("Button"+str(n))
		btn.get_child(1).visible = false
		btn.get_child(0).get_child(0).texture = null
		btn.get_child(0).get_child(1).texture = null
		btn.get_child(0).get_child(2).texture = null
		btn.get_child(0).get_child(3).texture = null
		btn.get_child(1).get_child(0).texture = null
		pass
	valueSet()
	pass


func _on_Mark_button_up():
	if get_parent().get_node("MarkWindow").markBoxV == true:
		get_parent().get_node("MarkWindow").textureReset()
		pass
	else:
		get_parent().get_node("MarkWindow").visible = true
		pass
	pass
