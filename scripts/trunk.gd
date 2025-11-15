extends Area2D
signal set_branch

var sir_nut: Node = null

var current_branch = 0
var rng = RandomNumberGenerator.new()

	
func tp_sir_nut(): 
	var next_branch: int = current_branch + rng.randi_range(-1, 1)
	next_branch = clamp(next_branch, 0, 1)

	var branch_name = "../Branch" + str(next_branch)
	print(branch_name)
	var branch = get_node(branch_name)
	var spot = branch.get_node("TeleportSpot")

	emit_signal("set_branch", spot.position)
	current_branch = next_branch


func sir_nut_hit_the_second_tower(body):
	if body.name == "Sir Nut":
		tp_sir_nut()

func _ready():
	#self.translate(	get_node("../Branch0/TeleportSpot").position)
	sir_nut = get_node("../Sir Nut")

	body_entered.connect(Callable(self, "sir_nut_hit_the_second_tower"))
	self.connect("set_branch", Callable(sir_nut, "set_branch"))
