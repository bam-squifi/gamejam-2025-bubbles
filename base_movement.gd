extends Node3D  # Ensure the base class is correct

# Exported variables for tuning tilt parameters in the editor
@export var tilt_speed: float = 2.0
@export var max_tilt_angle: float = 45.0

@onready var csg_box: CSGBox3D = $CSGBox3D
@onready var plane_body: StaticBody3D = $StaticBody3D

func _process(delta: float):
	# Read input
	#print("Key pressed" + Input.get_action_strength("plane_left"))
	var tilt_x = Input.get_action_strength("plane_down") - Input.get_action_strength("plane_up")
	var tilt_z = Input.get_action_strength("plane_right") - Input.get_action_strength("plane_left")

	# Calculate new tilt angles
	var new_tilt_x = clamp(tilt_x * tilt_speed, -max_tilt_angle, max_tilt_angle)
	var new_tilt_z = clamp(tilt_z * tilt_speed, -max_tilt_angle, max_tilt_angle)
