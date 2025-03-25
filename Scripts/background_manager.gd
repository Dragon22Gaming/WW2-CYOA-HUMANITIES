extends Sprite2D

var current_background := ""
@onready var background_node := $"."

func _onready():
	background_node.Texture = $"Art/icon.svg"
