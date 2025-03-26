extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_settings_pressed():
	pass

func death():
	# They will suffer if they choose this option >:3
	$Dont_Go.visible = true
	$Dont_Go/Heart.visible = true
	abort_mission_commander(5)

func abort_mission_commander(time: int):
	await get_tree().create_timer(time).timeout
	get_tree().quit()
