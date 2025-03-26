extends Control

@onready var background: TextureRect = $"Background"
@onready var character_image: TextureRect = $"Character_Image"
@onready var character_name: Label = $"Character_Name"

func _ready():
	change_background(Global.default_background)
	change_character("rich_bitch")
	change_name("Steve The Shaman :3")

func change_background(background_key: String):
	if background_key in Global.backgrounds.keys():
		background.texture = Global.backgrounds[background_key]

func change_character(character_key: String):
	if character_key in Global.characters.keys():
		character_image.texture = Global.characters[character_key]

func change_name(name: String):
	character_name.text = name
	print("character_name changed to: '" + name + "'")
