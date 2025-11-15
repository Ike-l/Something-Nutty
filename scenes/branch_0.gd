extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.translate(get_node("../Branch0/TeleportSpot").position - Vector2(0, 0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
