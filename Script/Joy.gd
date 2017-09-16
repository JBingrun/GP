
extends Node2D


var joy_num
var cur_joy
var axis_value

const DEADZONE = 0.2

func _fixed_process(delta):
	# Get the joystick device number from the spinbox
	joy_num = 0

	# Display the name of the joystick if we haven't already
	if joy_num != cur_joy:
		cur_joy = joy_num

func _ready():
	set_fixed_process(true)
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")


func _on_start_vibration_pressed():
	var weak = 1
	var strong = 1
	var duration = 1

	Input.start_joy_vibration(cur_joy, weak, strong, duration)

func _on_stop_vibration_pressed():
	Input.stop_joy_vibration(cur_joy)
