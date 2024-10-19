extends Node2D

var pointer = load("res://assets/sprites/busGame/pointer.png")
var presser = load("res://assets/sprites/busGame/presser.png")
var grabber = load("res://assets/sprites/busGame/grabber.png")
var isGrabber = false
var outsideGrabber = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(pointer)

func grab() -> void:
	isGrabber = true
	outsideGrabber = false
	
func press() -> void:
	outsideGrabber = true

func _input(event):
	if event is InputEventMouseButton and event.button_index == 1 and not event.is_pressed() and outsideGrabber:
		isGrabber = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left_mouse") && isGrabber:
		Input.set_custom_mouse_cursor(grabber)
	elif Input.is_action_pressed("left_mouse"):
		Input.set_custom_mouse_cursor(presser)
	else:
		Input.set_custom_mouse_cursor(pointer)
