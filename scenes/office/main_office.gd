extends Node2D

@onready var cam: Camera2D = $Camera2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var honk = $honk

# Input flags
var is_looking_left: bool = false
var is_looking_right: bool = false

# Config
var pan_speed: float = 1000.0  # pixels per second
var min_x: float = -240.0     # max left
var max_x: float = 240.0      # max right

func _process(delta: float) -> void:
	var movement: float = 0.0

	if is_looking_left:
		movement = -pan_speed * delta
	elif is_looking_right:
		movement = pan_speed * delta

	# Move camera and clamp position to bounds
	cam.position.x = clamp(cam.position.x + movement, min_x, max_x)
	var cam_x: float = cam.position.x
	var percent: float = clamp(cam_x / max_x, -1.0, 1.0)


func _on_button_pressed() -> void:
	honk.play()


func _on_area_2d_left_fast_mouse_entered() -> void:
	is_looking_left = true


func _on_area_2d_left_fast_mouse_exited() -> void:
	is_looking_left = false


func _on_area_2d_right_fast_mouse_entered() -> void:
	is_looking_right = true


func _on_area_2d_right_fast_mouse_exited() -> void:
	is_looking_right = false
