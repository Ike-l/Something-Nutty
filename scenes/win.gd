extends Area2D

var c = 0

func _on_body_entered(body: Node2D) -> void:
	c += 1
	if c == 1:
		return
	get_node("../../Control/Button").visible = true
	get_node("../../Control/Label2").visible = true
		
