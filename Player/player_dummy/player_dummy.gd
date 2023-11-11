extends "res://Player/PlayerBase.gd"

@onready var dummy_player = $"."

func _ready():
	#绑定具体角色资源
	animation_player = $AnimationPlayer		#角色动画
	skeleton = $Skeleton2D					#骨骼
	polygon = $Polygon2D					#角色图片
	
	#设置角色属性
	hp = DEF_HP
	movement = DEF_MOVEMENT
	mainAct = DEF_MAIN_ACT
	extraAct = DEF_EXTRA_ACT
	
	#设置角色初始位置
	initPos = Vector2(2,2)
	
	#启动！
	super._ready()
