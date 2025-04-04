extends Control

@onready var background: TextureRect = $"Background"
@onready var character_image: TextureRect = $"Character_Image"
@onready var character_name: Label = $"Character_Name"
@onready var responses = $"Dialogue_Background/Responses"
@onready var dialogue_box = $Dialogue_Background/Dialogue_Box
@onready var Irene = get_node("Irene")
@onready var Chester = get_node("Chester")
@onready var Lillian = get_node("Lillian")
@onready var yes = "res://Scenes/main_menu.tscn"
var backgrounds = {"Irene":"res://Art/room_1.png","Lillian":"res://Art/room_2.png","Chester":"res://Art/room_3.png"}
var person
var where_im_at = "start"
var current_dialogue: String = ""

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#when the player interacts with a person they need to responds based off of that option
#DO IT NOW YOU LITTLE SHIT :3
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

func _ready() -> void:
	where_im_at = "start"
	background.texture = load("res://Art/room_3.png")
	change_character("friend")
	change_name("Kouyou")
	change_dialogue("Who should we talk to?")
	change_responses(["Irene - Black Market Dealer", "Chester - Butcher", "Lillian - Former Nurse"])
	preload("res://Art/room_1.png")
	preload("res://Art/room_2.png")

func change_character(character_key: String)-> void:
	if character_key == "":
		character_image.texture = load("res://Art/no.png")
	if character_key in Global.characters.keys():
		character_image.texture = Global.characters[character_key]

func change_name(text: String) -> void:
	character_name.text = text
	print("character_name changed to: '" + text + "'")

func change_dialogue(text: String) -> void:
	dialogue_box.text = text

func change_responses(allowed_responses: Array) -> void:
	responses.clear()
	for response in allowed_responses:
		responses.add_item(response, load("res://Art/no.png"))

func _on_response(index: int) -> void:
	if person == null:
		where_im_at = "start"
		match index:
			0: 
				person = Irene
				handle_response("Irene")
				return
			1: 
				person = Chester
				handle_response("Chester")
				return
			2: 
				person = Lillian
				handle_response("Lillian")				
				return
	print("handling response:", person.responses[where_im_at][index])
	handle_response(person.responses[where_im_at][index])

func handle_response(response) -> void:
	if where_im_at == "start":
		match response:
			"Irene": 
				set_character("Irene")
				background.texture = load("res://Art/room_1.png")
			"Lillian": 
				set_character("Lillian")
				background.texture = load("res://Art/room_2.png")
			"Chester": 
				set_character("Chester")
	if response == "arrested":
		lose("arrested")
	if response == "stabbed":
		lose("stabbed")
	
	if response in person.dialogue:
		change_dialogue(person.dialogue[response])
	else: print("invalid dialogue key: " + response)
	
	if response in person.responses:
		change_responses(person.responses[response])
	else: print("invalid response key: " + response)
	where_im_at = response

func set_character(character: String) -> void:
	where_im_at = "start"
	match character:
		"Irene":
			person = Irene
			change_character("Irene")
			change_name("Irene")
			change_responses(person.responses["start"])
			change_dialogue(person.dialogue["start"])
		
		"Lillian":
			person = Lillian
			change_character("Lillian")
			change_name("Lillian")
			change_responses(person.responses["start"])
			change_dialogue(person.dialogue["start"])
		
		"Chester":
			person = Chester
			change_character("Chester")
			change_name("Chester")
			change_responses(person.responses["start"])
			change_dialogue(person.dialogue["start"])

func abort_mission_commander(time: int):
	await get_tree().create_timer(time).timeout
	get_tree().change_scene_to_file(yes)

func lose(condition: String):
	print("lose triggered:", condition)
	get_tree().change_scene_to_file("res://Scenes/ending.tscn")
	#Depending on your death, change to the death scenes
	pass

func win(condition: String):
	print("win triggered:", condition)
	match condition:
		"escape": pass
	#change to win scene
