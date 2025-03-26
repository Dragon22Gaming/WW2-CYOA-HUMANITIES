extends Control

@onready var background: TextureRect = $"Background"
@onready var character_image: TextureRect = $"Character_Image"
@onready var character_name: Label = $"Character_Name"
@onready var responses = $"Dialogue_Background/Responses"
@onready var dialogue_box = $Dialogue_Background/Dialogue_Box
@onready var rich_bitch = get_node("Rich Bitch")
var where_im_at = "start"
var current_dialogue: String = ""

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#when the player interacts with a person they need to responds based off of that option
#DO IT NOW YOU LITTLE SHIT :3
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

func _ready():
	print("Rich bitch dialogue: " + rich_bitch.dialogue["start"])
	print("Rich bitch responses (what you can reply with):")
	var i: int = 0
	for response in rich_bitch.responses["start"]:
		i += 1
		print(i, ": " + response)
	
	change_background(Global.default_background)
	change_character("rich_bitch")
	change_name("I... AM STEVE")
	change_dialogue(rich_bitch.dialogue["start"])
	change_responses(rich_bitch.responses["start"])

func change_background(background_key: String):
	if background_key in Global.backgrounds.keys():
		background.texture = Global.backgrounds[background_key]

func change_character(character_key: String):
	if character_key in Global.characters.keys():
		character_image.texture = Global.characters[character_key]

func change_name(text: String):
	character_name.text = text
	print("character_name changed to: '" + text + "'")

func change_dialogue(text: String):
	dialogue_box.text = text

func change_responses(allowed_responses: Array):
	responses.clear()
	for response in allowed_responses:
		responses.add_item(response, load("res://Art/icon.svg"))

func _on_response(index: int) -> void:
	print("Response: " + rich_bitch.responses[where_im_at][index])
	handle_response(rich_bitch.responses[where_im_at][index])

func handle_response(response):
	where_im_at = response
	if response in rich_bitch.dialogue:
		change_dialogue(rich_bitch.dialogue[response])
	else: print("invalid dialogue key: " + response)
	if response in rich_bitch.responses:
		change_responses(rich_bitch.responses[response])
	else: print("invalid response key: " + response)
