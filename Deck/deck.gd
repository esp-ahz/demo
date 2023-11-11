extends Node2D

var slot = preload("res://Deck/Slot/slot.tscn")

const kSlotSize = 128
const kSlotMagin = 10

# exposed variables
var cards = []
var renderDeck = false

# private variables
var _slots = []

func _ready():
	pass

func _process(delta):
	if renderDeck:
		delete_children()
		put_cards_into_slots()
		for s in _slots:
			add_child(s)
		renderDeck = false

func delete_children():
	var children = get_children()
	for c in children:
		c.queue_free()
	
func put_cards_into_slots():
	_slots.resize(cards.size())
	
	# TODO(hangcen): 渲染卡牌槽的边框
	for i in range(cards.size()):
		var s = slot.instantiate()
		s.position = Vector2(i * (kSlotSize+kSlotMagin), 0)
		
		if cards[i] != null:
			cards[i].position = Vector2(0, 0)
			s.add_child(cards[i])
		
		_slots[i] = s

func _render_deck():
	renderDeck = true
		
