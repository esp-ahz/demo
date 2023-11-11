extends Node2D

var old_position: Vector2
var dragable = false


func _ready():
	old_position = global_position

func _process(delta):
	if dragable:
		# click card event: global state is_dragging_card = true
		if Input.is_action_just_pressed("click"):
			global.is_draging_card = true
	
		# move the card while dragging the card
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
			
		# release click event: global state is_dragging_card = false
		elif Input.is_action_just_released("click"):
			global.is_draging_card = false
			
			# TODO(esphe): if the card is used, do something here
			
			# if the card is not used, return to old position
			global_position = old_position


func _on_area_2d_mouse_entered():
	if not global.is_draging_card:
		dragable = true

func _on_area_2d_mouse_exited():
	if not global.is_draging_card:
		dragable = false
