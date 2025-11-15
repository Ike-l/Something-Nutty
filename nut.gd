extends Area2D

var speed: float = 750.0 
var velocity: Vector2 = Vector2.ZERO 

func _physics_process(delta: float) -> void:
	position += velocity * delta

func launch(direction: Vector2):
	velocity = direction.normalized() * speed


func _on_body_entered(body : Node2D):
	queue_free() 
