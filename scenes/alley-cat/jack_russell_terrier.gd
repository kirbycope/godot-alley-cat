extends Node3D

@onready var animation_player = $Lowpoly_JR_Terrier_RM/AnimationPlayer
var initial_position = null
var tween = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_position = position
	reset_position()


func _on_timer_timeout() -> void:
	Globals.play_sound("res://assets/sounds/160092__jorickhoofd__dog-bark-1.wav")
	var new_position = position + Vector3(8, 0, 0)
	tween = get_tree().create_tween()
	tween.tween_property($".", "position", new_position, 4)
	tween.tween_callback(reset_position)
	animation_player.play("Arm_Dog|Run_F")


func reset_position() -> void:
	animation_player.play("Arm_Dog|idle_1")
	position = initial_position
	tween = null
