extends Area2D
var global = preload("res://global.gd").new()
var dragable = false
var is_inside_dropable = false
var body_ref

func _ready():
	pass


func _process(delta):
	pass
	

func _on_coin_body_entered(body):
	if not global.is_draging_card:
		dragable = true
		scale = Vector2(1.05, 1.05)
		
func _on_coin_body_exited(body):
	if not global.is_draging_card:
		dragable = false
		scale = Vector2(1, 1)
