extends Button


func _on_pressed() -> void:
	text = "Loading.."
	await get_tree().process_frame
	await get_tree().process_frame 
	get_tree().change_scene_to_file("res://scenes/StartMenu.tscn")
