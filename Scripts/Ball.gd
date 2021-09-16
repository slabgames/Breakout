extends RigidBody2D

export var SPEEDUP = 4
export var MAXSPEED  = 300

signal brick_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	
	for body in bodies:
		if body.is_in_group("Bricks"):
			body.queue_free()
			emit_signal("brick_hit")
		elif body.get_name() == "Paddle":
			var speed = linear_velocity.length()
			
			var direction:Vector2 = position - body.get_node("Ancor").global_position
			var velocity = direction.normalized() * min(speed +SPEEDUP, MAXSPEED)
			linear_velocity = velocity
			print(speed)
			pass
		
	if position.y > get_viewport_rect().end.y:
		print("Died")
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
