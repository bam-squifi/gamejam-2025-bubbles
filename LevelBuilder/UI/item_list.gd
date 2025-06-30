extends ItemList

func _on_item_selected(index: int) -> void:
	print(index)
	
	var path = "res://3D Models/Assets_full.fbx"
	var glb_scene: PackedScene = ResourceLoader.load(path)
	
	if glb_scene:
		var glb_instance: Node3D = glb_scene.instantiate()
		get_parent().get_parent().get_parent().get_parent().get_parent().add_child(glb_instance)
	else:
		print("Failed to load .glb at ", path)
