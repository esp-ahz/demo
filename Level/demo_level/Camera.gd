extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var pull = false
var mousePos
var moving
var currentPos
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_released("ScrollUp"):
	#	if zoom.x >= 0.8 and zoom.y >= 0.8:
	#		zoom.x -= 0.2
	#		zoom.y -= 0.2
	#if Input.is_action_just_released("ScrollDown"):
	#	if zoom.x <= 4 and zoom.y <= 4:
	#		zoom.x += 0.2
	#		zoom.y += 0.2
	#if Input.is_action_just_pressed("LMB"):
	#	mousePos = get_global_mouse_position()
	#if Input.is_action_pressed("LMB"):
	#	currentPos = get_global_mouse_position()
	#	offset.x -= currentPos.x-mousePos.x
	#	offset.y -= currentPos.y - mousePos.y
	
	if moving:
		currentPos = get_global_mouse_position()
		offset.x -= currentPos.x - mousePos.x
		offset.y -= currentPos.y - mousePos.y
		
	pass
		
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MIDDLE and event.is_pressed():
		mousePos = get_global_mouse_position()
		moving = true
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MIDDLE and !event.is_pressed():
		moving = false
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		if zoom.x >= 0.8 and zoom.y >= 0.8:
			zoom.x -= 0.1
			zoom.y -= 0.1
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		if zoom.x <= 1.8 and zoom.y <= 1.8:
			zoom.x += 0.1
			zoom.y += 0.1
	pass	
