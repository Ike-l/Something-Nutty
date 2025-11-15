extends Area2D
signal set_branch

var sir_nut: Node = null

var current_branch = 0
var rng = RandomNumberGenerator.new()


#func tp_sir_nut(): 
	## todo
	#next_branch = current_branch + rng.randi_range(-1.0, 1.0)
	#if next_branch == -1:
		#next_branch = 0
		#
	#var branch_location = get_node("Branch" + next_branch).position
	#var new_location = branch_location + 
	#emit_signal("set_branch", new_location)

#func sir_nut_hit_the_second_tower(body):
	#if body.name == "Sir Nut":
		#tp_sir_nut()

func _ready():
	sir_nut = get_node("../Sir Nut")

	body_entered.connect(Callable(self, "sir_nut_hit_the_second_tower"))
	self.connect("set_branch", Callable(sir_nut, "set_branch"))
