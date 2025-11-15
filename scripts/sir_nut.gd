extends CharacterBody2D


var speed = 100
const JUMP_VELOCITY = -400.0
	


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		position.x -= 1
		
	if Input.is_action_pressed("move_right"):
		position.x += 1
		
	if Input.is_action_pressed("move_down"):
		position.y += 1
		
	if Input.is_action_pressed("move_up"):
		position.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	#position += velocity * delta
		
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	move_and_slide()
