extends AnimatedSprite2D
@onready var dave = $"../Dave"
@export var speed = 200
enum state {moving, idle, throwing}
@export var curr_state = state.moving
var screen_size


@onready var my_timer = $"../Timer"
@export var nut_scene: PackedScene
@onready var nut_spawn_point = $"nut_spawn_point_d"

var rng = RandomNumberGenerator.new()

func _ready():
	screen_size = get_viewport_rect().size


func _process(float) -> void:		
	match curr_state:
		state.moving:
			self.play("WalkRight")
		state.idle:
			self.play("default-Blink")
		state.throwing:
			self.play("Throw")
	
