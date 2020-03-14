extends LevelDataLoader

export var placeable_items : NodePath

onready var placeable_items_node = get_node(placeable_items)

func _ready():
	var data = LevelData.new()
	data.load_in(load("res://assets/level_data/test_level.tres").contents)
	load_in(data, data.areas[0])
	
func _process(delta):
	#if Input.is_action_just_pressed("reload"): - Why is this in the editor
		#get_tree().reload_current_scene()
	pass
