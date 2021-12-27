extends KinematicBody2D

var velocity = Vector2.ZERO

# 窗口加载后会调用一次
#func _ready():
#	print("I am ready！")


# 这个函数 每一帧都会调用一次
# 1、delta是每一帧消耗的时间，每当需要绑定到时间时都要处理ta
# 2、_process是真实帧 随机能波动 还有一个_physice_process是物理帧 必定60/s
const MAX_SPEED = 150
const ACCELERATION = 250
const FRICTION = 500
func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") \
						 - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") \
						 - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
