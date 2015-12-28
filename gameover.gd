extends Panel

func _ready():
	get_node("score_display").set_text("Score: " + str(get_node("/root/global").get_score()))
	if (get_node("/root/global").get_score() > 840):
		get_node("result_display").set_text("WON!")
	else:
		get_node("result_display").set_text("LOST.")

func _on_goto_scene_pressed():
	get_node("/root/global").goto_scene("res://start.xml")