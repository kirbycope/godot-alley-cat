extends Node3D

@onready var animation_player = $Lowpoly_JR_Terrier_RM/AnimationPlayer
@onready var fight_cloud = $FightCloud

var cat_initial_position = null
var dog_initial_position = null
var tween = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cat_initial_position = Globals.get_player().position
	dog_initial_position = position
	reset_dog_position()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		fight_cloud.emitting = true
		Globals.play_audio("res://assets/sounds/415209__inspectorj__cat-screaming-a.wav")
		Globals.play_audio("res://assets/sounds/485961__spacejoe__dog-barking-distance-2.wav")
		tween.kill()
		start_attack_timer()


func _on_run_timer_timeout() -> void:
	Globals.play_sound("res://assets/sounds/160092__jorickhoofd__dog-bark-1.wav")
	var new_position = position + Vector3(8, 0, 0)
	tween = get_tree().create_tween()
	tween.tween_property($".", "position", new_position, 4)
	tween.tween_callback(reset_dog_position)
	animation_player.play("Arm_Dog|Run_F")


func reset_cat_position() -> void:
	Globals.get_player().position = cat_initial_position	# Play sound
	Globals.play_sound("res://assets/sounds/cat-meowing-joshua-chivers-1-00-01.mp3")


func reset_dog_position() -> void:
	animation_player.play("Arm_Dog|idle_1")
	fight_cloud.emitting = false
	position = dog_initial_position
	tween = null


func start_attack_timer() -> void:
	# Lock the player's movement
	Globals.movement_locked = true
	# Hide the cat
	Globals.get_player().visible = false
	# Hide the dog
	$Lowpoly_JR_Terrier_RM.visible = false
	# Create a Timer instance
	var timer = Timer.new()
	timer.wait_time = 2.0
	timer.one_shot = true
	# Add the timer as a child to the current node
	add_child(timer)
	# Connect the timeout signal
	timer.timeout.connect(_on_timer_timeout)
	# Start the timer
	timer.start()


# Signal callback function
func _on_timer_timeout():
	Globals.movement_locked = false	
	# Show the cat
	Globals.get_player().visible = true
	# Show the dog
	$Lowpoly_JR_Terrier_RM.visible = true
	reset_cat_position()
	reset_dog_position()
