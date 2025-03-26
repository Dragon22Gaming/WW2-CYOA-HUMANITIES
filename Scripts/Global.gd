extends Node

@export_enum("room_one","room_two","room_three") var default_room = "room_two"
@export_enum("rich_bitch", "depressed") var default_character = "rich_bitch"
@onready var current_room = default_room
@onready var current_character = default_character

func _ready():
	print("The Global is alive >:3")

func change_background():
	pass

func change_character(name: String, character_key: String):
	pass
