extends AnimatedSprite2D
@export var speed = 200
@onready var my_timer = $"../Timer"
var screen_size
enum state {moving, idle, throwing}
var curr_state = state.moving

var rng = RandomNumberGenerator.new()

func _ready():
	screen_size = get_viewport_rect().size
	if rng.randf() <0.5:
		speed *= -1 #left



func _physics_process(delta):
	var velocity = Vector2.ZERO
	if curr_state == state.moving:
		if position.x <= 0 and speed <0:
			speed *= -1 
			self.play("WalkRight")
		elif position.x > screen_size.x and speed > 0:
			speed *= -1
			self.play("WalkLeft")
			#velocity.x = speed
		
		if (position + Vector2(speed*delta, 0)).x < -137:
			speed *= -1
			self.play("WalkRight")
		elif (position + Vector2(speed*delta, 0)).x > 500:
			speed *= -1
			self.play("WalkLeft")

		position += Vector2(speed*delta, 0)
	
	
#func _physics_process(delta):
	#if curr_state == state.moving:
		## Directly update the node's position
		#position += Vector2(speed * delta, 0)


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
			self.play("WalkRight")
		state.idle:
			self.play("default-Blink")
		state.throwing:
			self.play("Throw")
	print(curr_state)
