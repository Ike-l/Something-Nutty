extends CharacterBody2D

const speed = 300

const gravitational_acceleration = 2

func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	
	velocity.y = gravitational_acceleration
	
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	if Input.is_action_pressed("move_up"):
		velocity.y -= 5
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	var collision = move_and_collide(velocity, true)
	move_and_slide()
	
	if collision:
		print(collision.get_position())
