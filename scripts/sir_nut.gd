extends CharacterBody2D
signal SirNutCollision
const SirNutCollisionLabel = "SirNutCollision"
@onready var trunk: RigidBody2D = $"Tree/Trunk"

var speed = 100
const JUMP_VELOCITY = -400.0

const LEFT = 0
const RIGHT = 1

var facing_direction = LEFT
var facing_dirty = false

var nuts = 0

func _ready() -> void:
	trunk.connect(SirNutCollisionLabel, Callable(trunk, "collided"))


func _process(delta: float) -> void:
	if facing_dirty:
		pass
		# set facing sprite


func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var collision = move_and_collide(velocity * delta)
	if collision:
		SirNutCollision.emit()
