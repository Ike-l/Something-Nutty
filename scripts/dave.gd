extends CharacterBody2D
@export var speed = 200
@onready var my_timer = $"../Timer"

@export var nut_scene: PackedScene
@onready var nut_spawn_point = $"nut_spawn_point_d"

var animated_dave: AnimatedSprite2D
var screen_size

enum state {moving, idle, throwing}
var curr_state 

var rng = RandomNumberGenerator.new()

func _ready():
	animated_dave = get_node("AnimatedDave")
	curr_state = animated_dave.curr_state
	screen_size = get_viewport_rect().size
	
	if rng.randf() <0.5:
		speed *= -1 #left



func _physics_process(delta):
	var velocity = Vector2.ZERO
	if curr_state == state.moving:
		#if position.x <= 0 and speed <0:
			#speed *= -1 
			#animated_dave.play("WalkRight")
		#elif position.x > screen_size.x and speed > 0:
			#speed *= -1
			#animated_dave.play("WalkLeft")
			##velocity.x = speed
		var direction = $"../../SirNut".find_child("Sir Nut").global_position.x - global_position.x
		if direction == 0:
			print()
		elif direction > 0:
			velocity.x = speed * delta
		else:
			velocity.x = -speed * delta
		# (player.x - position.x)
		
		if (position + velocity).x < -137:
			speed *= -1
			animated_dave.play("WalkRight")
		elif (position + velocity).x > 500:
			speed *= -1
			animated_dave.play("WalkLeft")

		position += velocity
		
	
	animated_dave.flip_h = velocity.x < 0
	

func fire_nut(): 
		var nut_instance = nut_scene.instantiate()
		nut_instance.global_position = nut_spawn_point.global_position
		get_tree().root.add_child(nut_instance)
		nut_instance.launch(Vector2.UP)
		print(curr_state)

func _on_timer_timeout() -> void:
	curr_state = [state.moving, state.idle, state.throwing][rng.rand_weighted([1, 0.1, 2])]
	if curr_state == state.throwing:
		fire_nut()
