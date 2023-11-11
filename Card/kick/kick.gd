extends Node

# 调用者需要维护 sourceRole \ targetRole
var sourceRole
var targetRole

# 需要让卡牌生效时，设置 used 为 true
var used

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if used: 
		# targetRole.HP = targetRole.HP - 1
		print("debug: kick is working")
		used = false
		pass
