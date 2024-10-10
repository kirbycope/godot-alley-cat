extends Node3D

var speed: float = 2.0
var move_direction: Vector3 = Vector3.ZERO
var movement_timer: float = 0.0
var switch_interval: float = 5.0
var pause_time: float = 5.0  # Pause time after switching direction
var is_paused: bool = false
var initial_position: Vector3
var movement_limit: float = 1.0

func _ready():
	randomize()
	initial_position = global_transform.origin  # Store the initial position
	_switch_direction()

func _process(delta):
	if is_paused:
		return  # Do nothing while paused

	movement_timer += delta
	if movement_timer >= switch_interval:
		movement_timer = 0.0
		_pause_movement()

	# Move the node left and right along the X-axis
	var new_position = global_transform.origin + move_direction * speed * delta

	# Ensure the node stays within the movement limit
	var offset_from_initial = new_position.x - initial_position.x
	if abs(offset_from_initial) > movement_limit:
		# Reverse direction if limit is exceeded
		move_direction.x *= -1
	else:
		global_transform.origin = new_position

func _pause_movement() -> void:
	is_paused = true
	move_direction = Vector3.ZERO  # Stop movement during the pause
	await get_tree().create_timer(pause_time).timeout  # Wait for the pause time
	_switch_direction()
	is_paused = false

func _switch_direction():
	# Choose randomly to move left or right
	if randi() % 2 == 0:
		move_direction = Vector3(-0.1, 0, 0)  # Move left
	else:
		move_direction = Vector3(0.1, 0, 0)  # Move right
