extends CharacterBody2D

const speed = 300

const gravitational_acceleration = 2
@export var nut_scene: PackedScene
@onready var nut_spawn_point = $nut_spawn_point

func fire_nut():
	var nut_instance = nut_scene.instantiate()
	nut_instance.global_position = nut_spawn_point.global_position
	get_parent().add_child(nut_instance)
	nut_instance.launch(Vector2.DOWN)

const JUMP_VELOCITY = -400.0

const LEFT = 0
const RIGHT = 1

var facing_direction = LEFT
var facing_dirty = false

var nuts = 0

func set_branch(new_position: Vector2):
	self.translate(-position)
	self.translate(new_position)
	velocity = Vector2.ZERO 


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
		if collision.get_collider().has_method("sir_nut_hit_the_second_tower"):
			collision.get_collider().call("sir_nut_hit_the_second_tower")
		
