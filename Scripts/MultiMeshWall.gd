extends Node3D

const BLOCK_SIZE = Vector3(1, 1, 0.2)
const WALL_WIDTH = 10
const WALL_HEIGHT = 5

func _ready():
	var box_mesh = BoxMesh.new()
	box_mesh.size = BLOCK_SIZE

	var multimesh = MultiMesh.new()
	multimesh.transform_format = MultiMesh.TRANSFORM_3D
	multimesh.mesh = box_mesh
	multimesh.instance_count = WALL_WIDTH * WALL_HEIGHT

	var i = 0
	for y in range(WALL_HEIGHT):
		for x in range(WALL_WIDTH):
			var offset = (y % 2) * (BLOCK_SIZE.x / 2.0)
			var position = Vector3(
				x * BLOCK_SIZE.x + offset,
				y * BLOCK_SIZE.y,
				0
			)
			var transform = Transform3D(Basis(), position)
			multimesh.set_instance_transform(i, transform)
			i += 1

	var mesh_instance = MultiMeshInstance3D.new()
	mesh_instance.multimesh = multimesh
	add_child(mesh_instance)
