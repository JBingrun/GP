extends RigidBody2D
var input_states = preload("res://Script/input_states.gd")#從外部叫入其他腳本

export var player_speed = 200
export var jump_force = 200
export var acceleration = 5
export var extra_gravity = 400

var raycast_down = null
var current_speed = Vector2(0, 0)


var btn_right = input_states.new("btn_right")
var btn_left = input_states.new("btn_left")
var btn_jump = input_states.new("btn_jump")

#var btn_right = Input.is_action_pressed("btn_right")
#var btn_left = Input.is_action_pressed("btn_left")
#var btn_jump = Input.is_action_pressed("btn_jump")


func move(speed, acc, delta): #acceleration促進
	current_speed.x = lerp(current_speed.x, speed, acc * delta)
	set_linear_velocity(Vector2(current_speed.x, get_linear_velocity().y))

func is_on_ground():
	if raycast_down.is_colliding():
		return true
		print("It hit the Ground")

	else:
		return false

func _ready():
	raycast_down = get_node("RayCast2D")
	raycast_down.add_exception(self)
	print(raycast_down.get_name())

	set_fixed_process(true)
	set_applied_force(Vector2(0, extra_gravity))

func _fixed_process(delta):
	#btn_right = Input.is_action_pressed("btn_right")
	#btn_left = Input.is_action_pressed("btn_left")
	#btn_jump = Input.is_action_pressed("btn_jump")
	#print("btn_right:", btn_right)



	if btn_left.check() == 2:
		move(-player_speed, acceleration, delta)

		#set_linear_velocity(Vector2(-player_speed, get_linear_velocity().y))
		#print(get_linear_velocity()) #get_linear_velocity().y 重力

	elif btn_right.check() == 2:
		move(player_speed, acceleration, delta)
		#set_linear_velocity(Vector2(player_speed, get_linear_velocity().y))
	else:
		move(0, acceleration, delta)
		#set_linear_velocity(Vector2(0, get_linear_velocity().y))

	if is_on_ground():
		if btn_jump.check() == 1:
			print("test")
			set_axis_velocity(Vector2(0, -jump_force)) #(負數是因為遊戲原點為0,0)
