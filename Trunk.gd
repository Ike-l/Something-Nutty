extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var current_branch = 0

var cooldown_time := 1.0
var can_hit := true

var rng = RandomNumberGenerator.new()

func sir_nut_hit_the_second_tower():
	if not can_hit:
		return
	
	can_hit = false
	
	var t = Timer.new()
	t.wait_time = cooldown_time
	t.one_shot = true
	t.connect("timeout", Callable(self, "_on_cooldown_timeout"))
	add_child(t)
	t.start()
	
	current_branch = (clamp(current_branch + 1, 0, 8))
	
	var node = get_node("../Branches/RigidBody2D" + str(current_branch))
	var next_position = node.global_position
	
	var sir_nut: CharacterBody2D = $"../../SirNut".find_child("Sir Nut")

	sir_nut.global_position = next_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_cooldown_timeout():
	can_hit = true
