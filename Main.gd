extends Area2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var ms = get_node("/root/Main")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		# マウスボタンの入力イベント
		if event.is_pressed():
			# クリックしたので、インスタンスを破棄
			if $Label.text == "+" or $Label.text == "-" or $Label.text == "÷" or $Label.text == "×":
				ms.sum = ms.number
				ms.number = "0" 
				ms.ope = $Label.text
			elif $Label.text == "CE":
				ms.number = "0"
				ms.sum = "0"
			elif $Label.text == "=":
				if ms.ope == "+":
					ms.intsum = int(ms.sum) + int(ms.number)
				elif ms.ope == "-":
					ms.intsum = int(ms.sum) - int(ms.number)
				elif ms.ope == "×":
					ms.intsum = int(ms.sum) * int(ms.number)
				elif ms.ope == "÷":
					ms.intsum = int(ms.sum) / int(ms.number)
				print(ms.intsum)
			else:
				ms.number += $Label.text
				print(ms.number)
			
