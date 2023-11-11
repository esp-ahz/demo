extends Node2D

var card = preload("res://Card/card.tscn")
var deck = preload("res://Deck/deck.tscn")

const kMaxCardNum = 7
const kCardNum = 5

var _deck
var _playerCard = []

func init_player_card():
	_playerCard.resize(kMaxCardNum)
	
	for i in range(kCardNum):
		_playerCard[i] = card.instantiate()
	
	_deck = deck.instantiate()
	_deck.position = Vector2(75, 908)
	_deck.cards = _playerCard
	_deck._render_deck()
	add_child(_deck)


func _ready():
	init_player_card()

	
func _process(delta):
	pass
