extends CharacterBody2D

@export var SPEED = 300.0
@onready var _animated_sprite = $AnimatedPlayerSprite

# Variable to store the currently interactable object
var current_interactable = null

func _physics_process(delta: float) -> void:
	# Get player direction
	var input_dir = Input.get_vector("left", "right", "up", "down")
	if input_dir.length() != 0:
		# Map player angle to an int 0-7
		var angle = input_dir.angle() / (PI/4)
		angle = wrapi(int(angle), 0, 8)
		# Play animation according to angle
		match angle:
			0:
				_animated_sprite.play("run_right")
			1:
				_animated_sprite.play("run_down_right")
			2:
				_animated_sprite.play("run_down")
			3:
				_animated_sprite.play("run_down_left")
			4:
				_animated_sprite.play("run_left")
			5:
				_animated_sprite.play("run_up_left")
			6:
				_animated_sprite.play("run_up")
			7:
				_animated_sprite.play("run_up_right")
	else:
		_animated_sprite.play("idle")

	# Move player
	velocity = input_dir * SPEED
	move_and_slide()

func _process(delta: float) -> void:
	
	# Handle player interaction
	if Input.is_action_just_pressed("interact") and current_interactable != null:
		print("action pressed.")
		# Call the interact method on the interactable object
		current_interactable.interact()

# Signal handler when the player enters an interactable object's Area2D
func _on_Area2D_body_entered(body):
	print("body entered")
	if body.is_in_group("interactable"):
		current_interactable = body  # Store the interactable object

# Signal handler when the player exits the interactable object's Area2D
func _on_Area2D_body_exited(body):
	print("body exited")
	if body == current_interactable:
		current_interactable = null  # Reset the interactable object when exiting the area
