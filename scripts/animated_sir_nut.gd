extends AnimatedSprite2D
@onready var sir_nut = $"../Sir Nut"
@export var speed: int = 300 
enum State {idle, jumping, catching, throwing, moving}
var curr_state = State.idle
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
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

	
