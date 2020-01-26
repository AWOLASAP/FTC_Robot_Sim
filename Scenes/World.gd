extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var audioPlayer = AudioStreamPlayer.new()
var audioPosition = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Create node for the background audio and load the source file
	self.add_child(audioPlayer)
	audioPlayer.stream = load("res://Sounds/HAW YEE.wav")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# Dpad right plays the background music, dpad left stops it
	if (Input.is_joy_button_pressed(0, JOY_DPAD_RIGHT) or Input.is_key_pressed(KEY_X))and !audioPlayer.is_playing():
		audioPlayer.play(audioPosition)
		print("Audio Playing")
	elif (Input.is_joy_button_pressed(0, JOY_DPAD_LEFT) or Input.is_key_pressed(KEY_Z))and audioPlayer.is_playing():
		audioPosition = audioPlayer.get_playback_position()
		audioPlayer.stop()
		print("Audio Stopping")
	
	# Adjust background music volume with dpad up and down
	if (Input.is_joy_button_pressed(0, JOY_XBOX_A) or Input.is_key_pressed(KEY_V)):# and audioPlayer.get_volume_db():
		audioPlayer.set_volume_db(audioPlayer.get_volume_db() + 1)
		print("Audio Volume Increase")
	elif (Input.is_joy_button_pressed(0, JOY_XBOX_Y) or Input.is_key_pressed(KEY_C)) and audioPlayer.get_volume_db() > -80:
		audioPlayer.set_volume_db(audioPlayer.get_volume_db() - 1)
		print("Audio Volume Decrease")
	
	# Quit game if "q" is pressed
	if Input.is_key_pressed(KEY_Q):
		get_tree().quit()
