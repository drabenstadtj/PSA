extends Area2D

# This method will be called when the player interacts
func interact():
	print("Interacted with:", self.name)
	# Add your custom interaction logic here
	# Assuming the 'Text' scene is already part of the scene tree
	var text_node = get_tree().root.get_node("Text")  # Make sure 'Text' is the correct path
	
	# Set the visibility to true to make it appear
	if text_node:
		text_node.visible = true
