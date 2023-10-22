extends CharacterBody2D

@onready var playerAni = $AnimatedSprite2D		#角色动画
@export var speed = 400

const SCALE = 96
const POSITION_FIX_X = 48
const POSITION_FIX_Y = 48
var initPos = Vector2(12,3)
var canMove = false
var destination = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	initPos[0] = initPos[0] * SCALE + POSITION_FIX_X
	initPos[1] = initPos[1] * SCALE + POSITION_FIX_Y
	position = initPos
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if canMove:
		moveTo(destination)
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		destination[0] = floor(get_global_mouse_position()[0] / 96)
		destination[1] = floor(get_global_mouse_position()[1] / 96)
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
	pass
	
func normalAtack():
	pass
	
func magic():
	pass
	
	
