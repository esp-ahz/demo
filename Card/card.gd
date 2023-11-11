extends Node2D
#var global = preload("res://global.gd")
var dragable = false
var is_inside_dropable = false
var body_ref		#选中的槽位
var second_body_ref	#因为一张card可能同时和两个槽位发生碰撞，所以有一个second作为候选
var have_2_body = false
var old_position: Vector2
var offset: Vector2
var timer		#缓动动画相关
const DURATION = 1.0

func _ready():
	old_position = global_position
	pass


func _process(delta):
	if dragable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			global.is_draging_card = true
			old_position = global_position
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			global.is_draging_card = false
			var tween = get_tree().create_tween()
			if is_inside_dropable and body_ref.is_occupied == false:
				tween.tween_property(self, "position", body_ref.global_position, 0.2).set_ease(Tween.EASE_OUT)
				body_ref.is_occupied = true
			else:
				tween.tween_property(self, "global_position", old_position, 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_mouse_entered():
	if not global.is_draging_card:
		dragable = true
		#scale *= 1.05
		#var tween = get_tree().create_tween()
		#tween.tween_property(self, "position", position + Vector2(0, -20), 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_mouse_exited():
	if not global.is_draging_card:
		dragable = false
		#scale /= 1.05
		#var tween = get_tree().create_tween()
		#tween.tween_property(self, "position", position + Vector2(0, 20), 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.AZURE, 0.7)
		second_body_ref = body_ref
		body_ref = body


func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.AZURE, 0.4)
		body_ref.is_occupied = false
		body_ref = second_body_ref
		
