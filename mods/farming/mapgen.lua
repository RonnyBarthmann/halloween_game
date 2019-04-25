function farming.register_decorations()

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass", "default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.012,
			scale = 0.024,
			spread = {x = 100, y = 100, z = 100},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"savanna"},
		y_min = 3,
		y_max = 31000,
		decoration = "farming:pumpkin",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_podzol"},
		sidelen = 16,
		noise_params = {
			offset = -0.012,
			scale = 0.024,
			spread = {x = 100, y = 100, z = 100},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"jungle"},
		y_min = 3,
		y_max = 31000,
		decoration = "farming:melon",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.015,
			scale = 0.025,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland"},
		y_min = 3,
		y_max = 31000,
		decoration = "farming:beetroot",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_spring_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.015,
			scale = 0.025,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"spring_grassland"},
		y_min = 3,
		y_max = 31000,
		decoration = "farming:carrot",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_spring_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.015,
			scale = 0.025,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"spring_grassland"},
		y_min = 3,
		y_max = 31000,
		decoration = "farming:potato",
	})

		minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.015,
			scale = 0.025,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"savanna"},
		y_min = 3,
		y_max = 31000,
		decoration = "farming:corn",
	})
end

farming.register_decorations()