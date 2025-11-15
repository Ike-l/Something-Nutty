extends Area2D
signal set_branch

var branch_map
var branch_locations

var sir_nut: Node = null

var current_branch = 0

enum Direction {
	LEFT,
	RIGHT
}

func tp_sir_nut():
	var next_branch = branch_map.get(current_branch)
	var new_location = branch_locations.get(next_branch)
	current_branch = next_branch
	emit_signal("set_branch", new_location)

func spawn_branch(location: Vector2, direction: Direction):
	pass

func sir_nut_hit_the_second_tower(body):
	if body.name == "Sir Nut":
		tp_sir_nut()

func _ready():
	sir_nut = get_node("../Sir Nut")
	branch_map = { 0: 1, 1: 2, 2: 3 }
	branch_locations = {
		0: Vector2(0, 0),
		1: Vector2(0, 0.1),
		2: Vector2(0, 0.2),
		3: Vector2(1, 0.05),
	}
	
	# spawn a branch for each branch location
	for k in branch_locations.keys():
		var location = branch_locations[k]
		var direction
		if location.x == 0:
			direction = Direction.LEFT
		else:
			direction = Direction.RIGHT
			
		# get location from offset from self
		$"../Trunk/ColorRect".shape.extents = Vector2(500, 500)
		#location.x = 
		#location.y
		spawn_branch(location, direction)
		

	body_entered.connect(Callable(self, "sir_nut_hit_the_second_tower"))
	self.connect("set_branch", Callable(sir_nut, "set_branch"))
