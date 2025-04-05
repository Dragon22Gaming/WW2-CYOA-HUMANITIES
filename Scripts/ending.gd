extends Control

func _ready() -> void:
	var label = $"ColorRect/and"
	var text: String
	var condition = Global.progress
	print("ending triggered with condition: ",condition)
	match condition:
		"arrested": text = "You were ratted out, you have been arrested and will remain in captivity until the war is over."
		"escaped": text = "You and Kouyou have successfully escaped america, and you two will travel to a country where you will be safe."
		"stabbed": text = "Chester has many issues, he likes violence and he just got his new blade. You and Kouyou look like the perfect targets to practise on."
	label.text = text
	await get_tree().create_timer(10).timeout
	Global.reset()
