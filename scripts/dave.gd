extends AnimatedSprite2D
@export var speed = 200
@onready var my_timer = $"../Timer"
var screen_size
enum state {moving, idle, throwing}
var curr_state = state.moving

var rng = RandomNumberGenerator.new()

func _ready():
	screen_size = get_viewport_rect().size



func _physics_process(delta):
	var velocity = Vector2.ZERO
	if curr_state == state.moving:
		velocity.x = speed
	


func _on_timer_timeout() -> void:
	var rand_num = rng.randi_range(0, 2)
	if rand_num == 0:
		curr_state = state.moving
	elif rand_num == 1:
		curr_state = state.idle
	elif rand_num == 2:
		curr_state = state.throwing
		
	match curr_state:
		state.moving:
			self.play("walk_right")
			print("moving")
		state.idle:
			self.play("default")
			print("idle")
		state.throwing:
			self.play("Throw")
			print("throwing")
