extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

# func _on_settings_pressed():
#	pass

func death():
	# They will suffer if they choose this option >:3
	$dontgo.visible = true
	$dontgo/heart.visible = true
	await get_tree().create_timer(5).timeout
	abort()

func abort():
	get_tree().quit()
