extends CharacterBody2D

@export var speed = 300

const gravitational_acceleration = 2
@export var nut_scene: PackedScene
@onready var nut_spawn_point = $"nut_spawn_point"
@onready var animated_sir_nut = $"AnimatedSirNut"
#enum state {idle, jumping, catching, throwing, moving}
var storage = 0
func fire_nut(): 
	if storage > 0:
		storage -= 1
		var nut_instance = nut_scene.instantiate()
		nut_instance.global_position = nut_spawn_point.global_position
		get_tree().root.add_child(nut_instance)
		nut_instance.launch(Vector2.DOWN)
		animated_sir_nut.curr_state = animated_sir_nut.State.throwing
		#print(self.global_position)
		#print(nut_instance.global_position)

const JUMP_VELOCITY = -400.0

const LEFT = 0
const RIGHT = 1

var facing_direction = LEFT
var facing_dirty = false

var nuts = 0


func _process(delta: float) -> void:
	if facing_dirty:
		pass
		# set facing sprite
	if Input.is_action_just_pressed("launch_acorn"):
		fire_nut()



func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	
	velocity.y = gravitational_acceleration
	
	var new_state = animated_sir_nut.State.idle
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		new_state = animated_sir_nut.State.moving
		
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		new_state = animated_sir_nut.State.moving
		
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		new_state = animated_sir_nut.State.moving
		
	if Input.is_action_pressed("move_up"):
		velocity.y -= 5
		new_state = animated_sir_nut.State.jumping
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	animated_sir_nut.flip_h = velocity.x < 0
	
	animated_sir_nut.curr_state = new_state
	move_and_slide()
	
	# Check collisions
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().has_method("sir_nut_hit_the_second_tower"):
			collision.get_collider().call("sir_nut_hit_the_second_tower")
