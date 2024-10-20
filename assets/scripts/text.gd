extends Control

@export var label_text: String = ""

@onready var label_node = $Label

func _ready():
	# Set the Label text when the scene starts
	label_node.text = label_text
