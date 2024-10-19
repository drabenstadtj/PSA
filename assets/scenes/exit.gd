extends Area2D

@onready var textbox = preload("res://assets/scenes/textbox.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	print("area entered")
	area.get_parent().set_interactable(self)
	
func _on_area_exited(area: Area2D) -> void:
	print("area exited")
	area.get_parent().set_interactable(null)


func interact():
	print("interacted")
	# Instantiate the Textbox scene
	var textbox_instance = textbox.instantiate()
	
	# Add it to the scene tree
	get_tree().root.add_child(textbox_instance)
		
	# Now attempt to get the Label node inside the Panel and set its text
	var label_node = textbox_instance.get_node("Panel/Label")
	if label_node != null:
		label_node.text = "exit?"
	else:
		print("Label node not found! Check your node path.")

	
	

	
