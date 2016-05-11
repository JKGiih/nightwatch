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

var just_pressed

func _ready():
	just_pressed = true
	set_fixed_process(true)

func _fixed_process(delta):
	if (not (Input.is_action_pressed("ACCEPT"))):
		just_pressed = false
	if (Input.is_action_pressed("ACCEPT") and not just_pressed):
		get_node("/root/global").goto_scene("res://start.xml")
