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

func _ready():
	velocity = 0
	acceleration = 20
	friction = 4
	set_fixed_process(true)
	
func _fixed_process(delta):
	if (get_node("/root/global").get_state() == "GAME"):
		if (velocity != 0):
			if (velocity > 0):
				velocity -= friction * delta
			if (velocity < 0):
				velocity += friction * delta
		velocity += acceleration * (randi() % 5 - 2) * delta
		if (velocity < -10):
			velocity = -10
		if (velocity > 10):
			velocity = 10
		self.set_pos(Vector2(self.get_pos().x+velocity, self.get_pos().y))
		if (self.get_pos().x < 128):
			self.set_pos(Vector2(128, self.get_pos().y))
			velocity = 0
		if (self.get_pos().x > 2608):
			self.set_pos(Vector2(2608, self.get_pos().y))
			velocity = 0