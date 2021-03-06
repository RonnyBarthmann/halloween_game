local function register_flower(seed, flower_name)
	minetest.register_decoration({
		name = "flowers:"..flower_name,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.04,
			spread = {x = 200, y = 200, z = 200},
			seed = seed,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland", "forest", "floatland_grassland"},
		y_max = 31000,
		y_min = 3,
		decoration = "flowers:"..flower_name,
	})
end

local function register_mushroom(mushroom_name)
	minetest.register_decoration({
		name = "flowers:"..mushroom_name,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"forest"},
		y_max = 31000,
		y_min = 3,
		decoration = "flowers:"..mushroom_name,
	})
end

local function register_waterlily()
	minetest.register_decoration({
		name = "default:waterlily",
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.12,
			scale = 0.3,
			spread = {x = 200, y = 200, z = 200},
			seed = 33,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"jungle_beach"},
		y_max = 0,
		y_min = 0,
		decoration = "flowers:waterlily",
		param2 = 0,
		param2_max = 3,
		place_offset_y = 1,
	})
end

function flowers.register_decorations()
	register_flower(436,     "fang_rose")
	register_flower(19822,   "skull_flower")
	register_flower(1220999, "sleep_flower")
	register_flower(1133,  "nightshade")
	register_flower(36662,   "mourningherb")
	register_flower(73133,    "gawk_orchid")

	register_mushroom("mushroom_brown")
	register_mushroom("mushroom_purble")

	register_waterlily()
end

flowers.register_decorations()
