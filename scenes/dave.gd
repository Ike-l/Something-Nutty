extends CharacterBody2D


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

enum State {
	Evasive,
	Aggressive,
	Resting,
}
var state: State

func _ready() -> void:
	var t = Timer.new()
	t.wait_time = 1
	t.connect("timeout", Callable(self, "_on_cooldown_timeout"))
	add_child(t)
	t.start()

var rng = RandomNumberGenerator.new()
func _on_cooldown_timeout():
	if rng.randf() < 0.25:
		var new_state = rng.randi_range(1, 3)
		match new_state:
			1:
				state = State.Evasive
			2:
				state = State.Aggressive
			_:
				state = State.Resting

			

func do_evasive():
	pass

func do_aggressive():
	pass
	
func do_resting():
	pass

func _physics_process(delta: float) -> void:
	match state:
		State.Evasive:
			do_evasive()
		State.Aggressive:
			do_aggressive()
		State.Resting:
			do_resting()
	pass
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
