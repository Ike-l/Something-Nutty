extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var current_branch = 1

func sir_nut_hit_the_second_tower():
	current_branch = (current_branch + 1) % 8
	var next_branch = current_branch
	print(next_branch)
	var node = get_node("../Branches/RigidBody2D" + str(next_branch))
	
	var next_position = node.global_position
	var sir_nut = $"../../SirNut"
	sir_nut.find_child("Sir Nut").velocity = Vector2(0, 0)
	sir_nut.global_position = next_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
