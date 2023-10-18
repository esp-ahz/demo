extends Node2D

@export var cell_scene: PackedScene

var cellSize = 50 # todo(hagncen): a better unit here
var levelMap = {}

func nextColor(color: String):
	if color == "black":
		return "white"
	return "black"	

func drawMap():
	var cellQueue: Array
	
	var cell = cell_scene.instantiate()
	cell.position = Vector2(cellSize, cellSize)
	cell.plainPosition = Vector2(1, 1)
	cell.cellType = "black"
	levelMap[cell.plainPosition] = cell
	
	var expandMap = [
		Vector2(0, 1),
		Vector2(1, 0)
	]
	
	var levelSize = 8
	
	cellQueue.append(cell)
	while !cellQueue.is_empty():
		cell = cellQueue.front()
		cellQueue.pop_front()
		print(cell.plainPosition)
		add_child(cell)
		
		
		for i in range (expandMap.size()):
			var nextPosition = expandMap[i] + cell.plainPosition
			if nextPosition.x <= levelSize && nextPosition.y <= levelSize && !(nextPosition in levelMap):
				var nextCell = cell_scene.instantiate()
				nextCell.plainPosition = nextPosition
				nextCell.position = nextPosition * cellSize
				nextCell.cellType = nextColor(cell.cellType)
				levelMap[cell.plainPosition] = cell
				cellQueue.append(nextCell)

# Called when the node enters the scene tree for the first time.
func _ready():
	drawMap()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
