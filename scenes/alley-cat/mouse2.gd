extends Node3D

var original_position = null
var tween = null

func _ready():
	original_position = position
	move_right_and_reset()

func move_right_and_reset():
	# Create a Tween node
	var new_position = position + Vector3(-8, 0, 0)
	tween = get_tree().create_tween()
	tween.tween_property($".", "position", new_position, 8)
	tween.tween_callback(reset_position)

func reset_position():
	position = original_position
	tween = null
	move_right_and_reset()
