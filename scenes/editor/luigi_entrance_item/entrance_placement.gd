func act(editor, position: Vector2, level_data: LevelData, level_area: LevelArea):
	var shared = editor.get_shared_node()
	var objects = shared.get_objects_node()

	var found_entrance = false

	for object in objects.get_children():
		if object.level_object.type_id == 5:
			found_entrance = true
			objects.set_property(object, "position", position)
			break

	return !found_entrance
