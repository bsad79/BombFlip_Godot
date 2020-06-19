extends Control

var difficultLvl
var grid
var gameMode
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
var table = ""


func _ready():
	sfxChannel = get_parent().get_node("sfx")
	musicChannel = get_parent().get_node("music")
	btnSfx = get_parent().get_node("Menu/Main/Sfx/Sfx")
	btnMusic = get_parent().get_node("Menu/Main/Music/Music")
	if btnMusic.is_pressed() == true:
		#musicChannel.stream = load("res://Sounds/Explosion.wav")
		pass
	get_node("MarkWindow").visible = false
	difficultLvl = 7
	difficultCheck()
	valueSet()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func difficultCheck():
	print("dif: "+str(difficultLvl))
	if(difficultLvl < 5):
		get_node("7x7").visible = false
		get_node("5x5").visible = true
		get_node("9x9").visible = false
		table = "5x5/"
		grid = 6
		pass
	if(difficultLvl > 4 && difficultLvl < 7):
		get_node("7x7").visible = true
		get_node("5x5").visible = false
		get_node("9x9").visible = false
		table = "7x7/"
		grid = 8
		pass
	if(difficultLvl > 6):
		get_node("7x7").visible = false
		get_node("5x5").visible = false
		get_node("9x9").visible = true
		table = "9x9/"
		grid = 10
		pass
	get_node("MarkWindow").table = table
	get_node("MarkWindow").markIcon = get_node(table+"Mark/TextureRect")
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
	sfxChannel.play()
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
		var btn = get_node(table+"Button"+str(n)+"/Panel/TextureRect")
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
		
		get_node(table+"Button"+str(n)+"/Panel").visible=false
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
	var panelP = get_node(table+"Panel"+str(rowCount)+"/GridContainer/Points")
	var panelB = get_node(table+"Panel"+str(rowCount)+"/GridContainer/GridContainer/BombQnt")
	panelP.set_text(str(sum))
	panelB.set_text(str(Zcount))
	pass


func colAuxSet():
	n = 0
	var Max = (grid-1)*(grid-1)
	for i in range(1,grid):
		for n in range(1,Max+1):
			if table == "5x5/":
				if(n == colCount or n == colCount + grid-1 or
				n == colCount + (2*(grid-1)) or n == colCount + (3*(grid-1)) or
				n == colCount + (4*(grid-1))):
					var btn = get_node(table+"Button"+str(n)+"/Panel/TextureRect")
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
				pass
			elif table == "7x7/":
				if(n == colCount or n == colCount + grid-1 or
				n == colCount + (2*(grid-1)) or n == colCount + (3*(grid-1)) or
				n == colCount + (4*(grid-1)) or n == colCount + (5*(grid-1)) or
				n == colCount + (6*(grid-1))):
					var btn = get_node(table+"Button"+str(n)+"/Panel/TextureRect")
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
				pass
				pass
			elif table == "9x9/":
				if(n == colCount or n == colCount + grid-1 or
				n == colCount + (2*(grid-1)) or n == colCount + (3*(grid-1)) or
				n == colCount + (4*(grid-1)) or n == colCount + (5*(grid-1)) or
				n == colCount + (6*(grid-1)) or n == colCount + (7*(grid-1)) or
				n == colCount + (8*(grid-1))):
					var btn = get_node(table+"Button"+str(n)+"/Panel/TextureRect")
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
				pass
				pass

			if(n == Max):
				var panelP = get_node(table+"Panel"+str(colCount+(grid-1))+"/GridContainer/Points")
				var panelB = get_node(table+"Panel"+str(colCount+(grid-1))+"/GridContainer/GridContainer/BombQnt")
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
		var btn = get_node(table+"Button"+str(n)+"/Panel/TextureRect")
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


func ScoreUpdate(point):
	if gameMode == "classic":
		get_node("Top/Score/Placar").text = str(score)
		pass
	else:
		get_node("Top/Score/Timer").add(point)
		pass
	if ThreeCount == 0 && TwoCount == 0:
		if gameMode == "timer":
			get_node("Top/Score/Timer").addBonus(table)
			get_node("Top/Score/Timer/Timer").paused = true
			pass
		yield(victory(), "completed")
		if gameMode == "timer":
			get_node("Top/Score/Timer/Timer").paused = false
			pass
		pass
	pass


func flip():
	var point = 0
	var btn = get_focus_owner()
	var texture = btn.get_child(1).get_child(0).texture
	if get_node("MarkWindow").markBoxV == true:
		get_node("MarkWindow").mark(btn.get_name())
		pass
	else:
		btn.get_child(1).visible = true
		if texture == btn0:
			sfx(texture)
			if gameMode == "timer":
				get_node("Top/Score/Timer/Timer").paused = true
				pass
			yield(defeat(), "completed")
			if gameMode == "timer":
				get_node("Top/Score/Timer/Timer").paused = false
				pass
			pass
		else:
			sfx(texture)
			pass
		if cardsF == 0:
			cardsF += 1
			if texture == btn1:
				score += 1
				point = 1
				pass
			elif texture == btn2:
				score += 2
				point = 2
				TwoCount -= 1
				pass
			elif texture == btn3:
				score += 3
				point = 3
				ThreeCount -= 1
				pass
			pass
		else:
			cardsF += 1
			if texture == btn1:
				score *= 1
				point = 1
				pass
			elif texture == btn2:
				score += 2
				point = 2
				TwoCount -= 1
				pass
			elif texture == btn3:
				score += 3
				point = 3
				ThreeCount -= 1
				pass
			pass
		ScoreUpdate(point)
		pass
	pass


func victory():
	difficultLvl += 1
	difficultCheck()
	get_parent().get_node("AnimBack").visible = true
	get_parent().get_node("AnimBack/VictoryPlay").play("Victory")
	yield(get_tree().create_timer(1.5), "timeout")
	get_parent().get_node("AnimBack").visible = false
	valueClear()
	pass
	
func defeat():
	score = 0
	cardsF = 0
	difficultLvl = 1
	get_parent().get_node("AnimBack").visible = true
	get_parent().get_node("AnimBack/LostPlay").play("Lose")
	yield(get_tree().create_timer(1.5), "timeout")
	get_parent().get_node("AnimBack").visible = false
	if gameMode == "timer":
		get_node("Top/Score/Timer").sec = 30
		get_node("Top/Score/Timer").minu = 1
		pass
	difficultCheck()
	valueClear()
	pass


func valueClear():
	gameMode = get_parent().get_node(".").gameMode
	rowCount = 0
	colCount = 1
	Zcount = 0
	OneCount = 0
	TwoCount = 0
	ThreeCount = 0
	sum = 0
	var Max = (grid-1)*(grid-1)
	for n in range(1,Max+1):
		var btn = get_node(table+"Button"+str(n))
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
	if get_node("MarkWindow").markBoxV == true:
		get_node("MarkWindow").textureReset()
		pass
	else:
		get_node("MarkWindow").visible = true
		pass
	pass

func _on_Back_button_up():
	difficultLvl = 1
	score = 0
	get_node("Top/Score/Placar").text = str(0)
	if get_node(".").gameMode == "timer":
		get_node("Top/Score/Timer").sec = 30
		get_node("Top/Score/Timer").minu = 1
		.get_node("Top/Score/Timer/Timer").stop()
		pass
	get_node(".").visible = false
	pass
