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
		var angle = round(input_dir.angle() / (PI/4))
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
		# Call the interact method on the interactable object
		current_interactable.interact()

func set_interactable(interactable: Node2D) -> void:
	current_interactable = interactable
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.has_method("interact"):
		set_interactable(area)

func _on_area_2d_area_exited(area: Area2D) -> void:
	set_interactable(null)
