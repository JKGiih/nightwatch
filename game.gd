extends Panel

func _ready():
	randomize()
	get_node("/root/global").reset_score()
	get_node("table/result").hide()
	get_node("/root/global").set_state("GAME")
	set_fixed_process(true)

func _fixed_process(delta):
	if (get_node("/root/global").get_state() == "GAME"):
		get_node("/root/global").increment_score(delta)
		get_node("table/time").set_text(get_node("/root/global").get_time_str())
		if (get_node("/root/global").get_score() > 840):
			get_node("/root/game").show_result()
			get_node("/root/global").set_state("GAMEOVER")
	if (get_node("/root/global").get_state() == "GAMEOVER"):
		if (Input.is_action_pressed("ACCEPT")):
			get_node("/root/music_player/SamplePlayer").play("tick", true)
			get_node("/root/global").goto_scene("res://start.xml")

func show_result():
	if (get_node("/root/global").get_score() > 840):
		get_node("table/result").set_text("YOU WON!")
	else:
		get_node("table/result").set_text("YOU LOST.")
	get_node("table/result").show()