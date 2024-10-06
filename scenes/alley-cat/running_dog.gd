extends Node3D

@onready var animation_player = $Lowpoly_JR_Terrier_RM/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("Arm_Dog|idle_1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
