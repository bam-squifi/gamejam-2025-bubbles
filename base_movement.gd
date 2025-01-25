extends CSGBox3D  # Root node

# Variables for rotation control
@export var sensitivity: float = 0.08  # Sensitivity of mouse movement
@export var max_tilt_angle: float = 45.0  # Maximum tilt angle in degrees
# To track current tilt angles
var tilt_x: float = 0.0
var tilt_z: float = 0.0

func _input(event: InputEvent):
	if event is InputEventMouseMotion:
		# Map mouse motion to tilt
		tilt_x -= event.relative.y * sensitivity  # Mouse Y controls pitch (X-axis rotation)
		tilt_z += event.relative.x * sensitivity  # Mouse X controls roll (Z-axis rotation)

		# Clamp tilt angles to the max tilt angle
		tilt_x = clamp(tilt_x, -max_tilt_angle, max_tilt_angle)
		tilt_z = clamp(tilt_z, -max_tilt_angle, max_tilt_angle)

		# Apply rotation to the CSGBox3D
		self.rotation_degrees.x = tilt_x
		self.rotation_degrees.z = tilt_z
