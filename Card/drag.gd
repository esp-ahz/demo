extends Node2D

var isMouseIn = false
var isDragging = false

var lastMousePos: Vector2

const sensitive = 1
const speed = 20.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isMouseIn == false && isDragging == false:
		return
		
	if Input.is_action_pressed("left_click"):
		isDragging = true	
		set_position(get_global_mouse_position())
		
		
	if Input.is_action_just_released("left_click"):
		isDragging = false
	
func _on_mouse_entered():
	if isDragging: 
		return 
	isMouseIn = true
	
func _on_mouse_exited():
	if isDragging: 
		return 
	isMouseIn = false
