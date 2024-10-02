extends Node3D

var swipe_start: Vector2
var swipe_threshold := 50.0
var tap_time_threshold := 0.3
var tap_start_time: float = 0.0


## Called when the node leaves the scene tree.
func _exit_tree() -> void:

	# [DEBUG] Message
	if Globals.debug_mode: print(Globals.time_stamp, " [DEBUG] '", get_script().resource_path.get_file().get_basename(), "' scene unloaded.")


## Called when the node enters the scene tree for the first time.
func _ready() -> void:

	# [DEBUG] Message
	if Globals.debug_mode: print(Globals.time_stamp, " [DEBUG] '", get_script().resource_path.get_file().get_basename(), "' scene loaded.")

	# Play music
	Globals.play_music("res://assets/sounds/01 Title Screen.mp3")


## Called when there is an input event. The input event propagates up through the node tree until a node consumes it.
func _input(event: InputEvent) -> void:

	# Check if the input is a Touch event
	if event is InputEventScreenTouch:
		# [touch] screen just _pressed_
		if event.is_pressed():
			# Record initial touch position
			swipe_start = event.position
			# Record initial touch time
			tap_start_time = Time.get_ticks_msec() / 1000.0
		# [touch] screen just _released_
		else:
			# Record final touch position
			var swipe_end = event.position
			# Calculate the differece from start and end positions
			var swipe_delta = swipe_end - swipe_start
			# Calculate the difference from start and end times
			var tap_duration = Time.get_ticks_msec() / 1000.0 - tap_start_time
			# [tap] touch just _released_
			if swipe_delta.length() < swipe_threshold and tap_duration < tap_time_threshold:
				# Start the game
				Globals.main.start()

	# Check if the game is no started
	if !Globals.main.game_started:

		# Check if the input is "start" or [Enter]
		if event is InputEventKey and event.pressed and event.keycode == KEY_ENTER:

			# Start the game
			Globals.main.start()
