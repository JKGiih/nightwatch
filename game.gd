##
##  NIGHTWATCH
##
##  Copyright 2015 Lasse Pouru
##
##  ====================================================================
##
##  This file is part of Nightwatch.
##
##  Nightwatch is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  Nightwatch is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with Nightwatch.  If not, see <http://www.gnu.org/licenses/>.

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