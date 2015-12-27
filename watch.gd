
extends RigidBody2D

# member variables here, example:
var velocity
var velocity2
var acceleration

func _ready():
	# Initialization here
	velocity = 0
	velocity2 = 0
	acceleration = 5
	set_fixed_process(true)
	
func _fixed_process(delta):
	if (get_node("raycast_up").is_colliding()):
		velocity -= acceleration * delta
	if (get_node("raycast_down").is_colliding()):
		velocity += acceleration * delta
	if (velocity < -5):
		velocity = -5
	if (velocity > 5):
		velocity = 5
	self.set_pos(Vector2(self.get_pos().x, self.get_pos().y+velocity))
	print (get_node("raycast_down").is_colliding(), get_node("raycast_up").is_colliding())
	
	
