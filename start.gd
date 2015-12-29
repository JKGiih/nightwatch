extends Panel

var cursor
var just_pressed

func _ready():
	cursor = "START"
	get_node("start").set_opacity(1)
	just_pressed = false
	set_fixed_process(true)
	
func _fixed_process(delta):
	if (not (Input.is_action_pressed("MOVE_UP") or Input.is_action_pressed("MOVE_DOWN"))):
		just_pressed = false
	if (Input.is_action_pressed("ACCEPT")):
		if (cursor == "START"):
			get_node("/root/global").goto_scene("res://game.xml")
		if (cursor == "INSTRUCTIONS"):
			get_node("/root/global").goto_scene("res://instructions.xml")
		if (cursor == "CREDITS"):
			get_node("/root/global").goto_scene("res://credits.xml")
		if (cursor == "QUIT"):
			get_tree().quit()
	if (Input.is_action_pressed("MOVE_UP") and just_pressed == false):
		if (cursor == "INSTRUCTIONS"):
			get_node("instructions").set_opacity(.5)
			get_node("start").set_opacity(1)
			cursor = "START"
		if (cursor == "CREDITS"):
			get_node("credits").set_opacity(.5)
			get_node("instructions").set_opacity(1)
			cursor = "INSTRUCTIONS"
		if (cursor == "QUIT"):
			get_node("quit").set_opacity(.5)
			get_node("credits").set_opacity(1)
			cursor = "CREDITS"
		just_pressed = true
	if (Input.is_action_pressed("MOVE_DOWN") and just_pressed == false):
		if (cursor == "CREDITS"):
			get_node("credits").set_opacity(.5)
			get_node("quit").set_opacity(1)
			cursor = "QUIT"
		if (cursor == "INSTRUCTIONS"):
			get_node("instructions").set_opacity(.5)
			get_node("credits").set_opacity(1)
			cursor = "CREDITS"
		if (cursor == "START"):
			get_node("start").set_opacity(.5)
			get_node("instructions").set_opacity(1)
			cursor = "INSTRUCTIONS"
		just_pressed = true
