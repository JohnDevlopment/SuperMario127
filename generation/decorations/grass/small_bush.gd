extends Decoration

func _init():
	chance_percentage = 25
	object_id = 12

func placement_check(tile, pos, noise, shared_node):
	return (
		tile == 2 
		and noise.get_noise_2d(pos.x - 2, pos.y) >= 0 
		and noise.get_noise_2d(pos.x - 2, pos.y - 1) <= 0 
		and noise.get_noise_2d(pos.x - 2, pos.y - 2) <= 0 
		and noise.get_noise_2d(pos.x - 1, pos.y) >= 0 
		and noise.get_noise_2d(pos.x - 1, pos.y - 1) <= 0 
		and noise.get_noise_2d(pos.x - 1, pos.y - 2) <= 0 
		and noise.get_noise_2d(pos.x, pos.y - 1) <= 0 
		and noise.get_noise_2d(pos.x, pos.y - 2) <= 0
	)

func get_placement_position(pos):
	return Vector2((pos.x * 32), (pos.y * 32) - 16)
