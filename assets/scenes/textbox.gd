extends Panel

@onready var label = $Label

var full_text = ""
var char_index = 0

# Speed of the text animation (in seconds)
@export var text_speed: float = 0.05
@export var min_panel_size: Vector2 = Vector2(200, 100)  # Set a minimum panel size

# Function to set the text and start animating it
func set_text(new_text: String):
	full_text = new_text
	char_index = 0
	label.text = ""
	adjust_panel_size()
	animate_text()

# Function to animate the text appearance
func animate_text() -> void:
	while char_index < full_text.length():
		label.text += full_text[char_index]
		char_index += 1
		adjust_panel_size()  # Adjust panel size as the text is added
		await get_tree().create_timer(text_speed).timeout

# Function to adjust the panel size based on the label content
func adjust_panel_size():
	# Get the size of the label's text
	var label_size = label.get_minimum_size()
	
	# Set the panel size to the label's size, but respect the minimum size
	size = Vector2(
		max(min_panel_size.x, label_size.x + 20),  # Add padding
		max(min_panel_size.y, label_size.y + 20)   # Add padding
	)
