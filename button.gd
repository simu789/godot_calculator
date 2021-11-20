extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var zeroflag = false

onready var ms = get_node("/root/main")
onready var label = get_node("/root/main/Label")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	if $Button.text == "+" or $Button.text == "-" or $Button.text == "÷" or $Button.text == "×":
		if ms.onceope == false:
			ms.onceope = true
			if ms.equalflag == true:
				ms.equalflag = false
				ms.sum = label.text
			else:
				ms.sum = ms.num
			label.text = $Button.text
			ms.num = "0" 
			ms.ope = $Button.text
	elif $Button.text == "CE":
		ms.num = "0"
		ms.sum = "0"
		label.text = "0"
		ms.equalflag = false
		ms.onceope == false
	elif $Button.text == "=" and ms.equalflag == false and ms.onceope == false:
		pass
	elif $Button.text == "=" and ms.equalflag == true and ms.onceope == false:
		ms.sum = str(ms.intsum)
		operator()
		label.text = str(ms.intsum)
	elif $Button.text == "=" and ms.equalflag == false and ms.onceope == true:
		operator()
		print(ms.intsum)
		ms.equalflag = true
		ms.onceope = false
		label.text = str(ms.intsum)
	else:
		if ms.equalflag == false:
			ms.num += $Button.text
			label.text = str(ms.num)
			print(ms.num)
func operator():
	if ms.ope == "+":
		ms.intsum = int(ms.sum) + int(ms.num)
	elif ms.ope == "-":
		ms.intsum = int(ms.sum) - int(ms.num)
	elif ms.ope == "×":
		ms.intsum = int(ms.sum) * int(ms.num)
	elif ms.ope == "÷":
		ms.intsum = int(ms.sum) / int(ms.num)
