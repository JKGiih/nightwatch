extends Panel

var just_pressed

func _ready():
	just_pressed = true
	set_fixed_process(true)

func _fixed_process(delta):
	if (not (Input.is_action_pressed("ACCEPT"))):
		just_pressed = false
	if (Input.is_action_pressed("ACCEPT") and not just_pressed):
		get_node("/root/global").goto_scene("res://start.xml")
