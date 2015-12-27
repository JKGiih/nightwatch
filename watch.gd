
extends RigidBody2D

# member variables here, example:
var velocity
var acceleration
var friction

func _ready():
	# Initialization here
	velocity = 0
	acceleration = 5
	friction = 3
	set_fixed_process(true)
	
func _fixed_process(delta):
	if (velocity != 0):
		if (velocity > 0):
			velocity -= friction * delta
		if (velocity < 0):
			velocity += friction * delta
	if (get_node("raycast_up").is_colliding()):
		velocity -= acceleration * delta
	if (get_node("raycast_down").is_colliding()):
		velocity += acceleration * delta
	if (velocity < -5):
		velocity = -5
	if (velocity > 5):
		velocity = 5
	self.set_pos(Vector2(self.get_pos().x, self.get_pos().y+velocity))
	if (self.get_pos().y < 128 or self.get_pos().y > 640):
		get_node("/root/global").goto_scene("res://gameover.xml")