
extends RigidBody2D

var velocity
var acceleration
var friction
var camera_direction

func _ready():
	velocity = 0
	acceleration = 20
	friction = 4
	camera_direction = -5
	set_fixed_process(true)
	
func _fixed_process(delta):
	if (get_node("/root/global").get_state() == "GAME"):
		if (velocity != 0):
			if (velocity > 0):
				velocity -= friction * delta
			if (velocity < 0):
				velocity += friction * delta
		if (Input.is_action_pressed("MOVE_LEFT")):
			velocity -= acceleration * delta
		if (Input.is_action_pressed("MOVE_RIGHT")):
			velocity += acceleration * delta
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
	if (get_node("/root/global").get_state() == "GAMEOVER"):
		get_node("Camera2D").set_offset(Vector2(get_node("Camera2D").get_offset().x + camera_direction, get_node("Camera2D").get_offset().y))
		if (get_node("Camera2D").get_camera_pos().x + get_node("Camera2D").get_offset().x < 300 or get_node("Camera2D").get_camera_pos().x + get_node("Camera2D").get_offset().x > 2436):
			camera_direction = camera_direction * -1