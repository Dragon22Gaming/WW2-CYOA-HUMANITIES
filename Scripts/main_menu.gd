extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func death():
	# They will suffer if they choose this option >:3
	$"dontgo".text = "Why? Why would you want to leave? Dont GOOOOO!"
	await get_tree().create_timer(5).timeout
	get_tree().quit()
