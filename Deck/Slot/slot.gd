extends StaticBody2D
#var global = preload("res://global.gd")
var is_occupied = false

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.AZURE, 0.4)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.is_draging_card:
		visible = true
	else:
		visible = true
	pass
