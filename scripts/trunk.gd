extends Area2D

func sir_nut_hit_the_second_tower(body):
	if body.name == "Sir Nut":
		print("H")
		emit_signal("sir_nut_entered")

func _ready():
	monitoring = true
	var sir_nut_node = $"../Sir Nut"
	body_entered.connect(Callable(self, "sir_nut_hit_the_second_tower"))
