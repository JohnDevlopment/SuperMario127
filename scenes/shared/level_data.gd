extends Node

var level_data : LevelData
var area := 0
var area_plr_2 := 0

var object_cache := []
var background_cache := []
var foreground_cache := []

var enemies_instanced := 0

# The music IDs that can be randomly selected, can be found in the level code
var random_music := [ 1, 3, 18, 16 ]

func pick_random_music() -> void:
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	var array_index = rng.randi_range(0, random_music.size() - 1)
	CurrentLevelData.level_data.areas[CurrentLevelData.area].settings.music = random_music[array_index]

func _ready() -> void:
	level_data = LevelData.new()
	level_data.load_in(load("res://assets/level_data/template_level.tres").contents)
	pick_random_music()
	
	# These checks prevent memory leaks, and make it much quicker to reset the level
	if object_cache.size() == 0:
		var object_id_map : IdMap = preload("res://scenes/actors/objects/ids.tres")
		for object_id in object_id_map.ids:
			object_cache.append(load("res://scenes/actors/objects/" + object_id + "/" + object_id + ".tscn"))
	
	if background_cache.size() == 0:
		var background_id_mapper : IdMap = preload("res://scenes/shared/background/backgrounds/ids.tres")
		for background_id in background_id_mapper.ids:
			background_cache.append(load("res://scenes/shared/background/backgrounds/" + background_id + "/resource.tres"))
	
	if foreground_cache.size() == 0:
		var foreground_id_mapper : IdMap = preload("res://scenes/shared/background/foregrounds/ids.tres")
		for foreground_id in foreground_id_mapper.ids:
			foreground_cache.append(load("res://scenes/shared/background/foregrounds/" + foreground_id + "/resource.tres"))
