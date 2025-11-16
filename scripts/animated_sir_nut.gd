extends AnimatedSprite2D
@onready var sir_nut = $"../Sir Nut"
@export var speed: int = 300 
enum State {idle, jumping, catching, throwing, moving}
var curr_state = State.idle
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	
	#var velocity = Vector2.ZERO # The player's movement vector
	#velocity.y = 2
	#if Input.is_action_pressed("move_right"):
		#velocity.x += 1
		#curr_state = State.moving
	#if Input.is_action_pressed("move_left"):
		#velocity.x -= 1
		#curr_state = State.moving
	#if Input.is_action_pressed("move_down"):
		#velocity.y += 1
		#curr_state = State.moving
	#if Input.is_action_pressed("move_up"):
		#velocity.y -= 1
		#curr_state = State.jumping
#
	#if velocity.length() > 0:
		#velocity = velocity.normalized() * speed
		##self.play()
	#
	#if velocity.x == 0:
		#curr_state = State.idle
	#
	#position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
		
	match curr_state:
		State.idle:
			self.play("Blink")
		State.jumping:
			self.play("Jump")
		State.catching:
			self.play("Catch")
		State.throwing:
			self.play("Throw")
		State.moving:
			self.play("Blink&Bounce")
	#print("current state: " , curr_state)

	
