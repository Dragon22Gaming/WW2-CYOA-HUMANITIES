extends Node

var current_character
var characters: Dictionary[String, Texture] = {"Irene": load("res://Art/asshole_1.png"), "Lillian": load("res://Art/nice_woman_crying.png"), "Chester": load("res://Art/stabby_stabby.png"), "friend": load("res://Art/friend.png")}
var backgrounds: Dictionary[String, Texture] = {"Irene": load("res://Art/icon.svg"), "Lillian": load("res://Art/room_2.png"), "Chester": load("res://Art/icon.svg")}
func _ready():
	print("The global is online >:3")
