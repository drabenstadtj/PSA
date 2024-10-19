extends Panel

# Variables for managing the text
@export var full_text: String = ""
@export var text_speed: float = 0.05  # Delay between each letter

var current_text: String = ""
var char_index: int = 0

# Reference to the Label node
@onready var label = $Label

# For managing the timer
var timer: Timer

func _ready():
	# Ensure the label text is empty initially
	label.text = ""
	
	# Create and start the timer
	timer = Timer.new()
	timer.wait_time = text_speed
	timer.one_shot = false
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	
	start_text_animation()

func start_text_animation():
	char_index = 0
	current_text = ""
	timer.start()

func _on_timer_timeout():
	if char_index < full_text.length():
		current_text += full_text[char_index]
		label.text = current_text
		char_index += 1
	else:
		timer.stop()

# Function to change dialogue text
func set_text(new_text: String):
	full_text = new_text
	start_text_animation()
