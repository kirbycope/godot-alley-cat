extends Node3D

var game_started: bool = false


## Called when the node leaves the scene tree.
func _exit_tree() -> void:

	# [DEBUG] Message
	if Globals.debug_mode: print(Globals.time_stamp, " [DEBUG] '", get_script().resource_path.get_file().get_basename(), "' scene unloaded.")


## Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# [DEBUG] Message
	if Globals.debug_mode: print(Globals.time_stamp, " [DEBUG] '", get_script().resource_path.get_file().get_basename(), "' scene loaded.")

	# Disable the mouse pointer and capture the motion
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	# Make sure the game is unpaused
	Globals.game_paused = false

	# Set the flag to match the scene's camera
	Globals.fixed_camera = true


# Start the game, if not started.
func start() -> void:

	# Check if the game has not started
	if !game_started:

		# Clear title screen
		$Title.queue_free()

		# Define next scene to load
		var path = "res://scenes/alley-cat/alley.tscn"

		# Load the scene
		var scene = load(path)

		# Instantiate the scene
		var instance_current = scene.instantiate()

		# Add the instance to the current scene
		add_child(instance_current)

		# Flag the game as started
		game_started = true
