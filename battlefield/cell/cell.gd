extends Node2D

@export var cellType: String
@export var plainPosition: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	var known_cell_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	var index = known_cell_types.find(cellType)
	if index == -1:
		cellType = "black"
	
	$AnimatedSprite2D.animation = cellType


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
