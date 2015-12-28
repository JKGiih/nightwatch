extends Panel

func _ready():
	randomize()
	get_node("/root/global").reset_score()
	set_fixed_process(true)

func _fixed_process(delta):
	get_node("/root/global").increment_score(delta)
	get_node("table/time").set_text(get_node("/root/global").get_time_str())
	if (get_node("/root/global").get_score() > 840):
		get_node("/root/global").goto_scene("res://gameover.xml")

func _on_goto_scene_pressed():
	get_node("/root/global").goto_scene("res://gameover.xml")