extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# Define a expressão da assitente para "acenando"
#	$Assitent.expressao = 5


func _on_out_pressed():
	get_tree().change_scene("res://Scenes/ClassRoom(main).tscn")

