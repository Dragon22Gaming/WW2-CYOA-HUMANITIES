extends Control

@onready var background = $Background
@onready var character_name = $Character_Name
@onready var dialogue = $"Dialogue_Background/Dialogue_Box"
@onready var character_image = $Character_Image
@onready var response_box = $Dialogue_Background/Responses
var progress = Global.progress
var current_character = Global.current_character
var responses

func _ready() -> void:
	progress = Global.current_character
	Global.change_character("Kouyou")
	Global.get_character_nodes(get_node("Irene"),get_node("Lillian"),
	get_node("Chester"), get_node("Kouyou"))
	change_responses("Who should we talk to?")

func _process(_delta: float) -> void:
	current_character = Global.current_character
	progress = Global.progress
	background.texture = load(Global.current_background)
	character_name.text = Global.current_name
	dialogue.text = Global.dialogue
	responses = Global.responses
	character_image.texture = Global.character_image
	#responses = Global.responses[progress]

func _on_response(index: int) -> void:
	current_character = Global.current_character
	print("current_character: ", current_character)
	print("i cant access idx 2 of this: ", current_character.responses[progress])
	var response = current_character.responses[progress][index]
	match response:
		"arrested":
			Global.progress = "arrested" 
			await get_tree().create_timer(2).timeout
			ending()
			return
		"stabbed":
			Global.progress = "stabbed"
			await get_tree().create_timer(2).timeout
			ending()
			return
		"escaped":
			Global.progress = "escaped"
			await get_tree().create_timer(2).timeout
			ending()
			return
		"Irene - Black Market Dealer": 
			Global.change_character("Irene")
			Global.current_character = Global.irene
			Global.progress = "start"
			change_responses(Global.progress)
		"Lillian - Ex-Nurse": 
			Global.change_character("Lillian")
			Global.current_character = Global.lillian
			Global.progress = "start"
			change_responses(Global.progress)
		"Chester - Butcher": 
			Global.change_character("Chester")
			Global.current_character = Global.chester
			Global.progress = "start"
			change_responses(Global.progress)
		_:
			change_responses(response)
	progress = Global.progress
	current_character = Global.current_character 
	print(current_character)
	change_dialogue(current_character.dialogue[progress])
	print(current_character.responses[progress])
	Global.progress = current_character.responses[progress][index]
	progress = Global.progress

func change_responses(last_response: String):
	response_box.clear()
	Global.responses = Global.current_character.responses
	for possible_response in Global.responses[last_response]:
		response_box.add_item(possible_response, load("res://Art/no.png"))

func change_dialogue(text: String):
	print("Changing dialogue to: ", text)
	Global.dialogue = text

func ending():
	get_tree().change_scene_to_file("res://Scenes/ending.tscn")
