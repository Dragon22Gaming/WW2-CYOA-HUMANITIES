extends Node

var current_character
var character_images: Dictionary[String, Texture] = {"Irene": load("res://Art/asshole_1.png"), "Lillian": load("res://Art/nice_woman_crying.png"), "Chester": load("res://Art/stabby_stabby.png"), "Kouyou": load("res://Art/friend.png"), "Stabby": load("res://Art/stabby_stabby_but_stabber.png")}
var main_menu = "res://Scenes/main_menu.tscn"
var backgrounds = {"Irene":"res://Art/room_1.png","Lillian":"res://Art/room_2.png","Chester":"res://Art/room_3.png","Kouyou":"res://Art/room_3.png"}
var current_name
var current_background
var init_responses = ["Irene - Black Market Dealer", "Lillian - Ex-nurse", "Chester - Butcher"]
var responses
var dialogue = "Who should we talk to?"
var progress = dialogue
var character_image
var irene
var lillian
var chester
var kouyou

func _ready():
	print("The global is online >:3")

func change_character(character_key: String):
	match character_key:
		"Kouyou": current_character = kouyou
		"Irene": current_character = irene
		"Chester": current_character = chester
		"Kouyou": current_character = kouyou
		_: print("invalid character key [Global:change_character()]",character_key)
	current_name = character_key
	current_background = backgrounds[character_key]
	character_image = character_images[character_key]

func get_character_nodes(Irene: Node, Lillian: Node, Chester: Node, Kouyou: Node):
	irene = Irene
	lillian = Lillian
	chester = Chester
	kouyou = Kouyou
	current_character = kouyou

func reset():
	print("quitting lol")
	get_tree().quit()
