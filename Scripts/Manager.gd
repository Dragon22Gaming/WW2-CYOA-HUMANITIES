extends Control

@onready var background: TextureRect = $"Background"
@onready var character_image: TextureRect = $"Character_Image"
@onready var character_name: Label = $"Character_Name"
@onready var Game_Manager: Node = $"/root/GameManager"
var characters: Dictionary[String, Texture] = {"rich_bitch": load("res://Art/asshole_1.png")}
var backgrounds: Dictionary[String, Texture] = {"room_one": load("res://Art/icon.svg"), "room_two": load("res://Art/room_2.png"), "room_three": load("res://Art/icon.svg")}

func _ready():
	change_background(Global.current_room)
	change_character("rich_bitch")
	change_name("Steve The Shaman")

func change_background(background_key: String):
	if background_key in backgrounds.keys():
		background.texture = backgrounds[background_key]

func change_character(character_key: String):
	if character_key in characters.keys():
		character_image.texture = characters[character_key]

func change_name(name: String):
	character_name.text = name
	print("character_name changed to: '" + name + "'")
