
extends RigidBody2D

# member variables here, example:
var velocity
var acceleration
var friction

func _ready():
	# Initialization here
	velocity = 0
	acceleration = 20
	friction = 4
	set_fixed_process(true)
	
func _fixed_process(delta):
	if (velocity != 0):
		if (velocity > 0):
			velocity -= friction * delta
		if (velocity < 0):
			velocity += friction * delta
	velocity += acceleration * (randi() % 3 - 1) * delta
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