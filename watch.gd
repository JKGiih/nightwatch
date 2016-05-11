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

extends RigidBody2D

var velocity
var acceleration
var friction
var original_x
var offset_x

func _ready():
	velocity = 0
	acceleration = 5
	friction = 3
	original_x = self.get_pos().x
	offset_x = 0
	get_node("raycast_down").add_exception(get_node("."))
	get_node("raycast_up").add_exception(get_node("."))
	set_fixed_process(true)
	
func _fixed_process(delta):
	if (get_node("/root/global").get_state() == "GAME"):
		if (velocity != 0):
			if (velocity > 0):
				velocity -= friction * delta
			if (velocity < 0):
				velocity += friction * delta
		if (velocity < -1 or velocity > 1):
			offset_x += (randi() % 3 - 1)
			if (offset_x < - 100):
				offset_x = 100
			if (offset_x > 100):
				offset_x = 100
		if (get_node("raycast_up").is_colliding()):
			velocity -= acceleration * delta
		if (get_node("raycast_down").is_colliding()):
			velocity += acceleration * delta
		if (velocity < -5):
			velocity = -5
		if (velocity > 5):
			velocity = 5
		self.set_pos(Vector2(original_x+offset_x, self.get_pos().y+velocity))
		if (self.get_pos().y < 220 or self.get_pos().y > 628):
			get_node("/root/music_player/SamplePlayer").play("tick", true)
			get_node("/root/game").show_result()
			get_node("/root/global").set_state("GAMEOVER")