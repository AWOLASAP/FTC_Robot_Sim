extends RigidBody2D

var SPEED_MULTIPLIER = 1500
	
var deadZone = 0.2

func adjust_for_deadzone(axis, deadzone):
	if abs(axis) < deadZone:
		axis = 0
	elif axis < 0:
		axis = (axis + 0.2) / 0.8
	else:
		axis = (axis - 0.2) / 0.8
	return axis

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	
	var Xmotion
	var Ymotion
	var moveDir = Vector2(0, 0)

	var lXAxis
	var lYAxis
	var rXAxis
	var rYAxis

	if Input.get_connected_joypads().size() > 0:
		lXAxis = adjust_for_deadzone(Input.get_joy_axis(0, JOY_AXIS_0), deadZone)
		lYAxis = adjust_for_deadzone(Input.get_joy_axis(0, JOY_AXIS_1), deadZone)

		rXAxis = adjust_for_deadzone(Input.get_joy_axis(0, JOY_AXIS_2), deadZone)
		rYAxis = adjust_for_deadzone(Input.get_joy_axis(0, JOY_AXIS_3), deadZone)
	else:
		lXAxis = 0
		lYAxis = 0
		
		rXAxis = 0
		rYAxis = 0
		
		if Input.is_action_pressed("ui_up"):
			rYAxis = -1
		elif Input.is_action_pressed("ui_down"):
			rYAxis = 1
		
		if Input.is_action_pressed("ui_right"):
			rXAxis = 1
		elif Input.is_action_pressed("ui_left"):
			rXAxis = -1
			
		if Input.is_action_pressed("2_ui_right"):
			lXAxis = 1
		elif Input.is_action_pressed("2_ui_left"):
			lXAxis = -1
		
	# Adjust speed
	Xmotion = ((SPEED_MULTIPLIER * rXAxis) * delta) / 2
	Ymotion = ((SPEED_MULTIPLIER * -rYAxis) * delta) / 1.3
	

	# Make movement based on rotation of the player, not screen
	if Xmotion >= Ymotion:
		self.set_applied_torque((lXAxis * SPEED_MULTIPLIER * 40 * (1/(abs(Xmotion/30) + 1))))
	else:
		self.set_applied_torque((lXAxis * SPEED_MULTIPLIER * 40 * (1/(abs(Ymotion/30) + 1))))
	
	moveDir.x = ((Xmotion * cos(rotation)) + (Ymotion * sin(rotation))) * 70
	moveDir.y += ((Ymotion * sin(rotation - PI/2)) + (Xmotion * cos(rotation - PI/2))) * 80
	
	self.set_applied_force(Vector2(moveDir.x, moveDir.y)) 

