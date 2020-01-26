extends Node2D

#var SPEED_MULTIPLIER = 150
#
#var deadZone = 0.2
#
#func adjust_for_deadzone(axis, deadzone):
#	if abs(axis) < deadZone:
#		axis = 0
#	elif axis < 0:
#		axis = (axis + 0.2) / 0.8
#	else:
#		axis = (axis - 0.2) / 0.8
#	return axis
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	self.add_child()
#
#func _physics_process(delta):
#
#	var Xmotion
#	var Ymotion
#	var moveDir = Vector2(0, 0)
#
#	var lXAxis
#	var lYAxis
#	var rXAxis
#	var rYAxis
#
#	if Input.get_connected_joypads().size() > 0:
#		lXAxis = adjust_for_deadzone(Input.get_joy_axis(0, JOY_AXIS_0), deadZone)
#		lYAxis = adjust_for_deadzone(Input.get_joy_axis(0, JOY_AXIS_1), deadZone)
#
#		rXAxis = adjust_for_deadzone(Input.get_joy_axis(0, JOY_AXIS_2), deadZone)
#		rYAxis = adjust_for_deadzone(Input.get_joy_axis(0, JOY_AXIS_3), deadZone)
#
#		# Adjust speed
#		#self.rotate(lXAxis / (SPEED_MULTIPLIER / 7))
#		Xmotion = ((SPEED_MULTIPLIER * rXAxis) * delta) / 2
#		Ymotion = ((SPEED_MULTIPLIER * -rYAxis) * delta) / 1.3
#
#		# Make movement based on rotation of the player, not screen
#		moveDir.x = (Xmotion * cos(rotation)) + (Ymotion * sin(rotation))
#		moveDir.y += (Ymotion * sin(rotation - PI/2)) + (Xmotion * cos(rotation - PI/2))
#
#		PlayerBody.add_central_force(Vector2(moveDir.x, moveDir.y)) 
#

	#move_and_collide(moveDir)

	

	
