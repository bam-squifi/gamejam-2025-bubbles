extends Node3D  # Root node

# Variables for rotation control
@export var sensitivity: float = 0.08  # Sensitivity of mouse movement
@export var max_tilt_angle: float = 45.0  # Maximum tilt angle in degrees
# To track current tilt angles
var tilt_x: float = 0.0
var tilt_z: float = 0.0

var input_allowed := false

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$LevelStartText/Ready.visible = true

func _input(event: InputEvent):
	if input_allowed and event is InputEventMouseMotion:
		# Map mouse motion to tilt
		tilt_x += event.relative.y * sensitivity  # Mouse Y controls pitch (X-axis rotation)
		tilt_z -= event.relative.x * sensitivity  # Mouse X controls roll (Z-axis rotation)

		# Clamp tilt angles to the max tilt angle
		tilt_x = clamp(tilt_x, -max_tilt_angle, max_tilt_angle)
		tilt_z = clamp(tilt_z, -max_tilt_angle, max_tilt_angle)

		# Apply rotation to the CSGBox3D
		self.rotation_degrees.x = tilt_x
		self.rotation_degrees.z = tilt_z
	
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_level_start_time_timeout() -> void:
	input_allowed = true
	$LevelStartText/Ready.visible = false
	$"LevelStartText/Go!".visible = true
