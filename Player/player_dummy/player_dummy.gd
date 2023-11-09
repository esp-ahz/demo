extends CharacterBody2D

@onready var animation_player = $AnimationPlayer		#角色动画
@onready var skeleton = $Skeleton2D						#骨骼
@export var speed = 500

# moving 移动相关
const SCALE = 96
const POSITION_FIX_X = 48
const POSITION_FIX_Y = 48
const initPos = Vector2(3,3)
var canMove = false
var destination = initPos

# charactor attributes 角色属性
const DEF_HP = 11 	#DEF for DEFAULT
const DEF_MOVEMENT = 3
const DEF_MAIN_ACT = 1
const DEF_EXTRA_ACT = 1
var hp = DEF_HP
var movement = DEF_MOVEMENT
var mainAct = DEF_MAIN_ACT
var extraAct = DEF_EXTRA_ACT

# equipment 角色装备
var weapon = [0, 0]
var armor = 0
var items = [0]
var maxItemNum = 1	# 可装备道具上限，由角色属性和装备决定

# magic list 角色法术
var magic = [0, 0]



# Called when the node enters the scene tree for the first time.
func _ready():
	var dest = Vector2(0, 0)
	dest[0] = initPos[0] * SCALE + POSITION_FIX_X
	dest[1] = initPos[1] * SCALE + POSITION_FIX_Y
	position = dest
	animation_player.play("待机")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if canMove:
		moveTo(destination)
	if not animation_player.is_playing():
		animation_player.play("待机")
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		destination[0] = floor(get_global_mouse_position()[0] / SCALE)
		destination[1] = floor(get_global_mouse_position()[1] / SCALE)
		canMove = true
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
		if floor(get_global_mouse_position()[0] / SCALE) < destination[0]:
			if skeleton.scale.x > 0:
				skeleton.scale.x = skeleton.scale.x * -1
		elif skeleton.scale.x < 0:
			skeleton.scale.x = skeleton.scale.x * -1
		normalAttack()
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
	animation_player.play("攻击")
	pass
	
	

	
	
