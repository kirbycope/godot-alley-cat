extends Node3D

@onready var animation_player = $AuxScene/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("Sit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !animation_player.is_playing():
		animation_player.play("Idle_A")
