extends RigidBody2D

enum State {
	Aggressive,
	Reloading,
	Evasive,
}

var state

@export
var nuts = 0

func tick(state: State) -> void:
	pass


func _ready() -> void:
	state = State.Reloading
	pass 


func _process(delta: float) -> void:
	tick(state)
	pass
