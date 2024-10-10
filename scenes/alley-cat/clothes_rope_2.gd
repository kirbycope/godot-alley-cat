extends Node3D

var speed: float = 5.0
var move_direction: Vector3 = Vector3.ZERO
var timer: float = 0.0
var switch_interval: float = 1.0
var initial_position: Vector3
var movement_limit: float = 1.0

func _ready():
	randomize()
	initial_position = global_transform.origin  # Store the initial position
	_switch_direction()

func _process(delta):
	timer += delta
	if timer >= switch_interval:
		timer = 0.0
		_switch_direction()

	# Move the node left and right along the X-axis
	var new_position = global_transform.origin + move_direction * speed * delta

	# Ensure the node stays within 5 units from the initial position
	var offset_from_initial = new_position.x - initial_position.x
	if abs(offset_from_initial) > movement_limit:
		# Reverse direction if limit is exceeded
		move_direction.x *= -1
	else:
		global_transform.origin = new_position

func _switch_direction():
	# Choose randomly to move left or right
	if randi() % 2 == 0:
		move_direction = Vector3(-0.1, 0, 0)  # Move left
	else:
		move_direction = Vector3(0.1, 0, 0)  # Move right
