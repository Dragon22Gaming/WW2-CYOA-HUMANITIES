extends Node

@export_enum("room_one","room_two","room_three") var default_background = "room_two"
@export_enum("rich_bitch", "depressed") var default_character = "rich_bitch"
@onready var current_background = default_background
@onready var current_character = default_character
var characters: Dictionary[String, Texture] = {"rich_bitch": load("res://Art/asshole_1.png"), "depressed": load("res://Art/nice_woman_crying.png"), "stabby": load("res://Art/stabby_stabby.png")}
var backgrounds: Dictionary[String, Texture] = {"room_one": load("res://Art/icon.svg"), "room_two": load("res://Art/room_2.png"), "room_three": load("res://Art/icon.svg")}

func _ready():
	print("The global is online >:3")
