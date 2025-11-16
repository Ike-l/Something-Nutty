extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var au = AudioStream.new()
	au.instantiate_playback()
