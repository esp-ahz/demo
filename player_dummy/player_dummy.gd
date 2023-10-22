extends CharacterBody2D

@onready var playerAni = $AnimatedSprite2D		#角色动画
@export var speed = 500

const SCALE = 96
const POSITION_FIX_X = 48
const POSITION_FIX_Y = 48
const initPos = Vector2(3,3)
var canMove = false
var destination = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	var dest = Vector2(0, 0)
	dest[0] = initPos[0] * SCALE + POSITION_FIX_X
	dest[1] = initPos[1] * SCALE + POSITION_FIX_Y
	position = dest
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if canMove:
		moveTo(destination)
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		destination[0] = floor(get_global_mouse_position()[0] / SCALE)
		destination[1] = floor(get_global_mouse_position()[1] / SCALE)
		canMove = true
	pass	

func moveTo(destination):
	var dest = Vector2(0, 0)
	dest[0] = destination[0] * SCALE + POSITION_FIX_X
	dest[1] = destination[1] * SCALE + POSITION_FIX_Y
	velocity = position.direction_to(dest) * speed
	if position.distance_to(dest) > 10:
		move_and_slide()
	else:
		position = dest
		canMove = false
	pass
	
func normalAttack():
	pass
	
func magic():
	pass
	
	
