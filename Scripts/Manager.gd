extends Control

@onready var background: TextureRect = $"Background"
@onready var character_image: TextureRect = $"Character_Image"
@onready var character_name: Label = $"Character_Name"
@onready var responses = $"Dialogue_Background/Responses"
@onready var dialogue_box = $Dialogue_Background/Dialogue_Box
@onready var rich_bitch = get_node("Rich Bitch")
@onready var stabby = get_node("Stabby Stabby")
@onready var depressed = get_node("Depressed")
@onready var yes = "res://Scenes/main_menu.tscn"
var person
var where_im_at = "start"
var current_dialogue: String = ""

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#when the player interacts with a person they need to responds based off of that option
#DO IT NOW YOU LITTLE SHIT :3
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

func _ready() -> void:
	where_im_at = "start"
	change_background(Global.default_background)
	change_character("")
	change_name("")
	change_dialogue("")
	change_responses(["Richy Bitchy", "Stabby Mcgee", "The Sad One"])

func change_background(background_key: String) -> void:
	if background_key in Global.backgrounds.keys():
		background.texture = Global.backgrounds[background_key]

func change_character(character_key: String)-> void:
	if character_key == "":
		character_image.texture = load("res://Art/no.png")
	if character_key in Global.characters.keys():
		character_image.texture = Global.characters[character_key]

func change_name(text: String) -> void:
	character_name.text = text
	print("character_name changed to: '" + text + "'")

func change_dialogue(text: String) -> void:
	if text == "DEATH":
		print("DEATH HAS OCCURED LOL :3")
		get_tree().change_scene_to_file(yes)
	else: dialogue_box.text = text

func change_responses(allowed_responses: Array) -> void:
	responses.clear()
	for response in allowed_responses:
		responses.add_item(response, load("res://Art/icon.svg"))

func _on_response(index: int) -> void:
	if person == null:
		where_im_at = "start"
		match index:
			0: 
				person = rich_bitch
				handle_response("Ritchy Bitchy")
				return
			1: 
				person = stabby
				handle_response("Stabby Mcgee")
				return
			2: 
				person = depressed
				handle_response("The Sad One")				
				return
	print("handling response:", person.responses[where_im_at][index])
	handle_response(person.responses[where_im_at][index])

func handle_response(response) -> void:
	if where_im_at == "start":
		match response:
			"Ritchy Bitchy": set_character("Ritchy Bitchy")
			"The Sad One": set_character("The Sad One")
			"Stabby Mcgee": set_character("Stabby Mcgee")
	if response in person.dialogue:
		change_dialogue(person.dialogue[response])
	else: print("invalid dialogue key: " + response)
	if response in person.responses:
		change_responses(person.responses[response])
	else: print("invalid response key: " + response)

func set_character(character: String) -> void:
	where_im_at = "start"
	match character:
		"Ritchy Bitchy":
			person = rich_bitch
			change_character("rich_bitch")
			change_name("Rich Bitch")
			change_responses(person.responses["start"])
			change_dialogue(person.dialogue["start"])
		
		"The Sad One":
			person = depressed
			change_character("depressed")
			change_name("Depressed")
			change_responses(person.responses["start"])
			change_dialogue(person.dialogue["start"])
		
		"Stabby Mcgee":
			person = stabby
			change_character("stabby")
			change_name("Stabby Stabby")
			change_responses(person.responses["start"])
			change_dialogue(person.dialogue["start"])
