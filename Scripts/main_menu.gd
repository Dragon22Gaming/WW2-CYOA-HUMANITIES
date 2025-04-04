extends Control

@onready var dont_go: Label = $Dont_Go
@onready var heart: TextureRect = $"Dont_Go/Heart"
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	preload("res://Art/room_3.png")

func _on_settings_pressed():
	pass

func death():
	# They will suffer if they choose this option >:3
	dont_go.visible = true
	heart.visible = true
	abort_mission_commander(3)

func abort_mission_commander(time: int):
	await get_tree().create_timer(time).timeout
	get_tree().quit()
