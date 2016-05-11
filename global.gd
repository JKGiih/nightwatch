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

extends Node

var current_scene = null
var score = null
var state = null

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child( root.get_child_count() -1)

func goto_scene(scene):
	current_scene.queue_free()
	var s = ResourceLoader.load(scene)
	current_scene = s.instance()
	get_tree().get_root().add_child(current_scene)

func set_state(s):
	state = s
	
func get_state():
	return state

func reset_score():
	score = 0
	
func increment_score(delta):
	score += delta
	
func get_score():
	return int(score)
	
func get_minutes():
	return get_score() % 60
	
func get_hours():
	return ((get_score() + 1080 - get_minutes()) / 60) % 24

func get_minutes_ones():
	return (get_minutes() % 10)
	
func get_minutes_tens():
	return (get_minutes() - get_minutes_ones()) / 10

func get_hours_ones():
	return (get_hours() % 10)
	
func get_hours_tens():
	return (get_hours() - get_hours_ones()) / 10
	
func get_time_str():
	return str(get_node("/root/global").get_hours_tens()) + str(get_node("/root/global").get_hours_ones()) + ":" + str(get_node("/root/global").get_minutes_tens()) + str(get_node("/root/global").get_minutes_ones())
	