extends Node2D  # This is the interactable object, like a door or NPC

# Path to the prefabbed Textbox scene
@export var textbox_scene: PackedScene = preload("res://assets/scenes/textbox.tscn")

# Text to display when the player interacts with this object
@export var interaction_text = "You interacted with the door"

# Called when the player interacts with the object
func interact():
	# Example interaction logic: Display interaction text in a Label or print to console
	print(interaction_text)
	# Call a function to show the prefabbed Textbox with the interaction text
	show_interaction_text(interaction_text)

# Function to show interaction text by instancing the prefabbed Textbox scene
func show_interaction_text(text: String):
	# Instance the Textbox from the packed scene
	var textbox_instance = textbox_scene.instantiate()

	# Assuming the Textbox has a Label or a similar child node to set the text
	textbox_instance.set_text("Label")  # Replace with the correct path to the Label inside the Textbox scene

	# Add the Textbox to the scene tree (as a child of a UI layer, or directly to the root)
	get_tree().root.add_child(textbox_instance)  # Add to the root or a UI container


func _on_area_2d_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
