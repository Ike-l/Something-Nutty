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
		if position.x <= 0 and speed <0:
			speed *= -1 
			animated_dave.play("WalkRight")
		elif position.x > screen_size.x and speed > 0:
			speed *= -1
			animated_dave.play("WalkLeft")
			#velocity.x = speed
		position += Vector2(speed*delta, 0)
	animated_dave.flip_h = speed < 0
	

func fire_nut(): 
		var nut_instance = nut_scene.instantiate()
		nut_instance.global_position = nut_spawn_point.global_position
		get_tree().root.add_child(nut_instance)
		nut_instance.launch(Vector2.UP)
		print(curr_state)

func _on_timer_timeout() -> void:
	var rand_num = rng.randi_range(0, 2)
	if rand_num == 0:
		curr_state = state.moving
	elif rand_num == 1:
		curr_state = state.idle
	elif rand_num == 2:
		curr_state = state.throwing
		fire_nut()
