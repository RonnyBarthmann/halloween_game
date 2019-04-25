minetest.register_alias("mapgen_air", "air")
minetest.register_alias("mapgen_dirt", "default:dirt")
minetest.register_alias("mapgen_coarse_dirt", "default:coarse_dirt")
minetest.register_alias("mapgen_gravel", "default:gravel")
minetest.register_alias("mapgen_cobble", "default:cobble")
minetest.register_alias("mapgen_clay", "default:clay")
minetest.register_alias("mapgen_lime", "default:lime")
minetest.register_alias("mapgen_sandcobble", "default:sandcobble")
minetest.register_alias("mapgen_desert_cobble", "default:desert_cobble")
minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_sandstone", "default:sandstone")
minetest.register_alias("mapgen_desert_stone", "default:desert_stone")
minetest.register_alias("mapgen_diorite", "default:diorite")
minetest.register_alias("mapgen_andesite", "default:andesite")
minetest.register_alias("mapgen_granite", "default:granite")
minetest.register_alias("mapgen_silver_sand", "default:silver_sand")
minetest.register_alias("mapgen_sand", "default:sand")
minetest.register_alias("mapgen_desert_sand", "default:desert_sand")
minetest.register_alias("mapgen_stone_with_coal", "default:stone_with_coal")
minetest.register_alias("mapgen_stone_with_copper", "default:stone_with_copper")
minetest.register_alias("mapgen_stone_with_tin", "default:stone_with_tin")
minetest.register_alias("mapgen_stone_with_iron", "default:stone_with_iron")
minetest.register_alias("mapgen_stone_with_silver", "default:stone_with_silver")
minetest.register_alias("mapgen_stone_with_gold", "default:stone_with_gold")
minetest.register_alias("mapgen_stone_with_mithril", "default:stone_with_mithril")
minetest.register_alias("mapgen_stone_with_adamantit", "default:stone_with_adamantit")
minetest.register_alias("mapgen_stone_with_khorium", "default:stone_with_khorium")
minetest.register_alias("mapgen_stone_with_kobalt", "default:stone_with_kobalt")
minetest.register_alias("mapgen_stone_with_mese", "default:stone_with_mese")
minetest.register_alias("mapgen_mese", "default:mese")
minetest.register_alias("mapgen_water_source", "default:water_source")
minetest.register_alias("mapgen_river_water_source", "default:river_water_source")
minetest.register_alias("mapgen_lava_source", "default:lava_source")
minetest.register_alias("mapgen_dirt_with_grass", "default:dirt_with_grass")
minetest.register_alias("mapgen_dirt_with_dry_grass", "default:dirt_with_dry_grass")
minetest.register_alias("mapgen_dirt_with_podzol", "default:dirt_with_podzol")
minetest.register_alias("mapgen_dirt_with_mycelium", "default:dirt_with_mycelium")
minetest.register_alias("mapgen_dirt_with_spring_grass", "default:dirt_with_spring_grass")
minetest.register_alias("mapgen_dirt_with_nether_grass", "default:dirt_with_nether_grass")
minetest.register_alias("mapgen_dirt_with_frost_grass", "default:dirt_with_frost_grass")
minetest.register_alias("mapgen_dirt_with_snow", "default:dirt_with_snow")

function default.register_ores()

	local stone_list = {
		{ "stone"},
		{ "sandstone"},
		{ "desert_stone"},
	}

	for i in ipairs(stone_list) do
		local node = stone_list[i][1]

	-- Coal

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_coal",
		wherein        = "default:"..node,
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = 31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_coal",
		wherein        = "default:"..node,
		clust_scarcity = 16 * 16 * 16,
		clust_num_ores = 27,
		clust_size     = 6,
		y_min          = -31000,
		y_max          = 0,
	})

	-- Copper

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_copper",
		wherein        = "default:"..node,
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = 0,
		y_max          = 31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_copper",
		wherein        = "default:"..node,
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = 0,
	})

	-- Tin

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_tin",
		wherein        = "default:"..node,
		clust_scarcity = 10 * 10 * 10,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = 0,
		y_max          = 31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_tin",
		wherein        = "default:"..node,
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = 0,
	})

	-- Iron

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_iron",
		wherein        = "default:"..node,
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 12,
		clust_size     = 3,
		y_min          = 0,
		y_max          = 31000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_iron",
		wherein        = "default:"..node,
		clust_scarcity = 19 * 19 * 19,
		clust_num_ores = 27,
		clust_size     = 6,
		y_min          = -31000,
		y_max          = -50,
	})

	-- Gold

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_gold",
		wherein        = "default:"..node,
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -50,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_gold",
		wherein        = "default:"..node,
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = -100,
	})

	-- Silver

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_silver",
		wherein        = "default:"..node,
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -50,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_silver",
		wherein        = "default:"..node,
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = -100,
	})

	-- Mithril

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_mithril",
		wherein        = "default:"..node,
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -5000,
		y_max          = -200,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_mithril",
		wherein        = "default:"..node,
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = -200,
	})

	-- Adamantit

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_adamantit",
		wherein        = "default:"..node,
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -5000,
		y_max          = -250,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_adamantit",
		wherein        = "default:"..node,
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -250,
	})

	-- Khorium

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_khorium",
		wherein        = "default:"..node,
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -5000,
		y_max          = -250,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_khorium",
		wherein        = "default:"..node,
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -250,
	})

	-- Kobalt

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_kobalt",
		wherein        = "default:"..node,
		clust_scarcity = 26 * 26 * 26,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = -200,
	})

	-- Mese crystal

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_mese",
		wherein        = "default:"..node,
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -150,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:"..node.."_with_mese",
		wherein        = "default:"..node,
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = -150,
	})

	end

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = {"default:stone", "default:sandstone", "default:desert_stone"},
		clust_scarcity = 36 * 36 * 36,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -31000,
		y_max          = -150,
	})

	-- Silver Sand

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:silver_sand",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"snowy_grassland", "snowy_grassland_ocean", "grassland", "grassland_beach", "grassland_ocean", "savanna", "savanna_ocean", "savanna_ocean",
			"frost_grassland_ocean", "spring_grassland", "mycelium", "nether_grassland", "frost_grassland", "forest", "jungle", "jungle_beach", "jungle_ocean", "taiga",
			"nether_grassland_ocean", "taiga_beach", "taiga_ocean", "underground"
		}
	})

	-- Sand

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:sand",
		wherein         = {"default:sandstone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"sandstone", "sandstone_ocean", "underground"}
	})

	-- Desert Sand

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:desert_sand",
		wherein         = {"default:desert_stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"desert", "desert_ocean", "underground"}
	})

	-- Diorite

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:diorite",
		wherein         = {"default:stone"},
		clust_scarcity  = 15 * 15 * 15,
		clust_num_ores = 33,
		clust_size     = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 128, y = 128, z = 128},
			seed = 90122,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"snowy_grassland", "snowy_grassland_ocean", "grassland", "grassland_beach", "grassland_ocean", "savanna", "savanna_ocean", "savanna_ocean",
			"frost_grassland_ocean", "spring_grassland", "mycelium", "nether_grassland", "frost_grassland", "forest", "jungle", "jungle_beach", "jungle_ocean", "taiga",
			"nether_grassland_ocean", "taiga_beach", "taiga_ocean", "underground"
		}
	})

	-- Andesite

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:andesite",
		wherein         = {"default:sandstone"},
		clust_scarcity  = 15 * 15 * 15,
		clust_num_ores = 33,
		clust_size     = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 128, y = 128, z = 128},
			seed = 90122,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"sandstone", "sandstone_ocean", "underground"}
	})

	-- Granite

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:granite",
		wherein         = {"default:desert_stone"},
		clust_scarcity  = 15 * 15 * 15,
		clust_num_ores = 33,
		clust_size     = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 128, y = 128, z = 128},
			seed = 90122,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"desert", "desert_ocean", "underground"}
	})

	-- Clay

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:clay",
		wherein         = {"default:stone", "default:sandstone", "default:desert_stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 8,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"snowy_grassland", "snowy_grassland_ocean", "grassland", "grassland_beach", "grassland_ocean", "savanna", "savanna_ocean", "savanna_ocean",
			"frost_grassland_ocean", "spring_grassland", "mycelium", "nether_grassland", "frost_grassland", "forest", "desert", "desert_ocean", "jungle", "jungle_beach",
			"nether_grassland_ocean", "jungle_ocean", "taiga", "taiga_beach", "taiga_ocean", "sandstone", "sandstone_ocean", "underground"
		}
	})

	-- Lime

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:lime",
		wherein         = {"default:stone", "default:sandstone", "default:desert_stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 8,
		y_max           = 31000,
		y_min           = -31,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"snowy_grassland", "snowy_grassland_ocean", "grassland", "grassland_beach", "grassland_ocean", "savanna", "savanna_ocean", "savanna_ocean",
			"frost_grassland_ocean", "spring_grassland", "mycelium", "nether_grassland", "frost_grassland", "forest", "desert", "desert_ocean", "jungle", "jungle_beach",
			"nether_grassland_ocean", "jungle_ocean", "taiga", "taiga_beach", "taiga_ocean", "sandstone", "sandstone_ocean", "underground"
		}
	})

	-- Gravel

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:gravel",
		wherein         = {"default:stone", "default:sandstone", "default:desert_stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 31000,
		y_min           = -31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"snowy_grassland", "snowy_grassland_ocean", "grassland", "grassland_beach", "grassland_ocean", "savanna", "savanna_ocean", "savanna_ocean",
			"frost_grassland_ocean", "spring_grassland", "mycelium", "nether_grassland", "frost_grassland", "forest", "desert", "desert_ocean", "jungle", "jungle_beach",
			"nether_grassland_ocean", "jungle_ocean", "taiga", "taiga_beach", "taiga_ocean", "sandstone", "sandstone_ocean", "underground"
		}
	})
end

function default.register_biomes()

	-- Spring Grassland

	minetest.register_biome({
		name = "spring_grassland",
		node_top = "default:dirt_with_spring_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 4,
		node_stone = "default:stone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 45,
		humidity_point = 70,
	})

	-- Grassland

	minetest.register_biome({
		name = "grassland",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 4,
		node_stone = "default:stone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_beach",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 2,
		y_min = -2,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = -2,
		y_min = -50,
		heat_point = 50,
		humidity_point = 35,
	})

	-- Forest

	minetest.register_biome({
		name = "forest",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 2,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 60,
		humidity_point = 68,
	})

	-- Desert

	minetest.register_biome({
		name = "desert",
		node_top = "default:desert_sand",
		depth_top = 2,
		node_filler = "default:desert_cobble",
		depth_filler = 3,
		node_stone = "default:desert_stone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 92,
		humidity_point = 16,
	})

	minetest.register_biome({
		name = "desert_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_stone = "default:desert_stone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 2,
		y_min = -50,
		heat_point = 92,
		humidity_point = 16,
	})

	-- Jungle

	minetest.register_biome({
		name = "jungle",
		node_top = "default:dirt_with_podzol",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 4,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "jungle_beach",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 2,
		y_min = -2,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "jungle_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = -3,
		y_min = -50,
		heat_point = 86,
		humidity_point = 65,
	})

	-- Mycelium

	minetest.register_biome({
		name = "mycelium",
		node_top = "default:dirt_with_mycelium",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 4,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 50,
		humidity_point = 25,
	})

	-- Taiga

	minetest.register_biome({
		name = "taiga",
		node_dust = "default:snow",
		node_top = "default:dirt_with_snow",
		depth_top = 1,
		node_filler = "default:coarse_dirt",
		depth_filler = 4,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 25,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "taiga_beach",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 2,
		y_min = -2,
		heat_point = 25,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "taiga_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = -3,
		y_min = -50,
		heat_point = 25,
		humidity_point = 70,
	})

	-- Sandstone

	minetest.register_biome({
		name = "sandstone",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_stone = "default:sandstone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 60,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "sandstone_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_stone = "default:sandstone",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 2,
		y_min = -50,
		heat_point = 60,
		humidity_point = 0,
	})

	-- Savanna

	minetest.register_biome({
		name = "savanna",
		node_top = "default:dirt_with_dry_grass",
		depth_top = 1,
		node_filler = "default:coarse_dirt",
		depth_filler = 4,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_beach",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 2,
		y_min = -2,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = -3,
		y_min = -50,
		heat_point = 89,
		humidity_point = 42,
	})

	-- Frostgrass

	minetest.register_biome({
		name = "frost_grassland",
		node_top = "default:dirt_with_frost_grass",
		depth_top = 1,
		node_filler = "default:coarse_dirt",
		depth_filler = 4,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 20,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "frost_grassland_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		node_water_top = "default:river_ice",
		depth_water_top = 5,
		y_max = 2,
		y_min = -50,
		heat_point = 20,
		humidity_point = 75,
	})

	-- Nethergrass

	minetest.register_biome({
		name = "nether_grassland",
		node_top = "default:dirt_with_nether_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 4,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 70,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "nether_grassland_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 2,
		y_min = -50,
		heat_point = 70,
		humidity_point = 75,
	})

	-- Icesheet

	minetest.register_biome({
		name = "icesheet",
		node_dust = "default:snow",
		node_top = "default:snowblock",
		depth_top = 1,
		node_filler = "default:ice",
		depth_filler = 3,
		node_stone = "default:packed_ice",
		node_riverbed = "default:ice",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 0,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "icesheet_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_stone = "default:packed_ice",
		node_water_top = "default:ice",
		depth_water_top = 5,
		y_max = 2,
		y_min = -50,
		heat_point = 0,
		humidity_point = 73,
	})

	-- Snowy grassland

	minetest.register_biome({
		name = "snowy_grassland",
		node_dust = "default:snow",
		node_top = "default:dirt_with_snow",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 31000,
		y_min = 3,
		heat_point = 20,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "snowy_grassland_ocean",
		node_top = "default:sand",
		depth_top = 2,
		node_filler = "default:sandcobble",
		depth_filler = 3,
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_max = 2,
		y_min = -50,
		heat_point = 20,
		humidity_point = 35,
	})

	-- Underground

	minetest.register_biome({
		name = "underground",
		y_max = -50,
		y_min = -31000,
		heat_point = 50,
		humidity_point = 50,
	})

end

local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland", "forest"},
		y_min = 3,
		y_max = 50,
		decoration = "default:grass_" .. length,
	})
end

local function register_frost_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_frost_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"frost_grassland"},
		y_min = 3,
		y_max = 50,
		decoration = "default:frost_grass_" .. length,
	})
end

local function register_nether_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_nether_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"nether_grassland"},
		y_min = 3,
		y_max = 50,
		decoration = "default:nether_grass_" .. length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"savanna"},
		y_min = 3,
		y_max = 50,
		decoration = "default:dry_grass_" .. length,
	})
end

local function register_spring_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_spring_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"spring_grassland"},
		y_min = 3,
		y_max = 50,
		decoration = "default:spring_grass_" .. length,
	})
end

local function register_mycelium_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_mycelium"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"mycelium"},
		y_min = 3,
		y_max = 50,
		decoration = "default:mycelium_grass_" .. length,
	})
end

function default.register_floatland_biomes(floatland_level, shadow_limit)

end

function default.register_decorations()

	-- Appletree

	minetest.register_decoration({
		name = "default:apple_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.024,
			scale = 0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"forest"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/apple_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"forest"},
		y_max = 31000,
		y_min = 3,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:tree", param2 = 12, prob = 191},
				{name = "default:tree", param2 = 12},
				{name = "default:tree", param2 = 12, prob = 127},
				{name = "air", prob = 0},
				{name = "flowers:mushroom_brown", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Jungletree

	minetest.register_decoration({
		name = "default:jungle_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_podzol"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"jungle"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_podzol"},
		sidelen = 80,
		fill_ratio = 0.005,
		biomes = {"jungle"},
		y_max = 31000,
		y_min = 3,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:jungletree", param2 = 12, prob = 191},
				{name = "default:jungletree", param2 = 12},
				{name = "default:jungletree", param2 = 12, prob = 127},
				{name = "air", prob = 0},
				{name = "flowers:mushroom_purble", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Pinetree

	minetest.register_decoration({
		name = "default:pine_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = 0.010,
			scale = 0.048,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		name = "default:small_pine_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = 0.010,
			scale = -0.048,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/small_pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow"},
		sidelen = 80,
		fill_ratio = 0.0018,
		biomes = {"taiga"},
		y_max = 31000,
		y_min = 3,
		schematic = {
			size = {x = 3, y = 2, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:pine_tree", param2 = 12, prob = 191},
				{name = "default:pine_tree", param2 = 12},
				{name = "default:pine_tree", param2 = 12, prob = 127},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})
	
	-- Frosttree

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_frost_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0018,
			scale = 0.0011,
			spread = {x = 250, y = 250, z = 250},
			seed = 230,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"frost_grassland"},
		y_max = 31000,
		y_min = 3,
		schematic = {
			size = {x = 3, y = 2, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:frost_tree", param2 = 12, prob = 191},
				{name = "default:frost_tree", param2 = 12},
				{name = "default:frost_tree", param2 = 12, prob = 127},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Acaciatree

	minetest.register_decoration({
		name = "default:acacia_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/acacia_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_max = 31000,
		y_min = 3,
		schematic = {
			size = {x = 3, y = 2, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:acacia_tree", param2 = 12, prob = 191},
				{name = "default:acacia_tree", param2 = 12},
				{name = "default:acacia_tree", param2 = 12, prob = 127},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Aspentree

	minetest.register_decoration({
		name = "default:aspen_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_spring_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"spring_grassland"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/aspen_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_spring_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.0008,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"spring_grassland"},
		y_max = 31000,
		y_min = 3,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:aspen_tree", param2 = 12},
				{name = "default:aspen_tree", param2 = 12},
				{name = "default:aspen_tree", param2 = 12, prob = 127},
				{name = "flowers:mushroom_purble", prob = 63},
				{name = "flowers:mushroom_brown", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "default:fern",
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.2,
			spread = {x = 100, y = 100, z = 100},
			seed = 14936,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"grassland", "forest"},
		y_max = 31000,
		y_min = 3,
		decoration = "default:fern",
	})

	-- Coaltree

	minetest.register_decoration({
		name = "default:coal_tree_small",
		deco_type = "schematic",
		place_on = {"default:dirt_with_nether_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"nether_grassland"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/default_coal_tree_small.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		name = "default:coal_tree_big",
		deco_type = "schematic",
		place_on = {"default:dirt_with_nether_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"nether_grassland"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/default_coal_tree_big.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	-- Junglegrass

	minetest.register_decoration({
		name = "default:junglegrass",
		deco_type = "simple",
		place_on = {"default:dirt_with_podzol"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"jungle"},
		y_min = 3,
		y_max = 31000,
		decoration = "default:junglegrass",
	})

	-- Netherflower

	minetest.register_decoration({
		name = "default:netherflower",
		deco_type = "simple",
		place_on = {"default:dirt_with_nether_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.04,
			spread = {x = 200, y = 200, z = 200},
			seed = 42,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"nether_grassland"},
		y_min = 3,
		y_max = 31000,
		decoration = "default:netherflower",
	})

	-- Frostflower

	minetest.register_decoration({
		name = "default:frostflower",
		deco_type = "simple",
		place_on = {"default:dirt_with_frost_grass"},
		noise_params = {
			offset = -0.02,
			scale = 0.04,
			spread = {x = 200, y = 200, z = 200},
			seed = 800081,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"frost_grassland"},
		y_min = 3,
		y_max = 31000,
		decoration = "default:frostflower",
	})

	-- Purble Mushroom

	minetest.register_decoration({
		name = "default:big_mushroom_purble",
		deco_type = "schematic",
		place_on = {"default:dirt_with_mycelium"},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"mycelium"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("flowers") .. "/schematics/flowers_big_mushroom_purble.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	-- Brown Mushroom

	minetest.register_decoration({
		name = "default:big_mushroom_brown",
		deco_type = "schematic",
		place_on = {"default:dirt_with_mycelium"},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"mycelium"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("flowers") .. "/schematics/flowers_big_mushroom_brown.mts",
		flags = "place_center_x, place_center_z",
	})

	-- Bush

	minetest.register_decoration({
		name = "default:bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"grassland", "forest"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/bush.mts",
		flags = "place_center_x, place_center_z",
	})

	-- Acacia bush

	minetest.register_decoration({
		name = "default:acacia_bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_dry_grass", "default:dirt_with_mycelium"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 90155,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"savanna", "mycelium"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/acacia_bush.mts",
		flags = "place_center_x, place_center_z",
	})

	-- Pine bush

	minetest.register_decoration({
		name = "default:pine_bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"taiga", "snowy_grassland"},
		y_max = 31000,
		y_min = 3,
		schematic = minetest.get_modpath("default") .. "/schematics/pine_bush.mts",
		flags = "place_center_x, place_center_z",
	})

	-- Cactus

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.012,
			scale = 0.024,
			spread = {x = 100, y = 100, z = 100},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 3,
		y_max = 50,
		decoration = "default:cactus",
		height = 1,
		height_max = 4,
	})

	-- Coaltree

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_nether_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.003,
			scale = 0.009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"nether_grassland"},
		y_min = 3,
		y_max = 50,
		decoration = "default:coal_tree",
		height = 3,
		height_max = 6,
	})

	-- Grasses

	register_grass_decoration(-0.03,  0.09,  5)
	register_grass_decoration(-0.015, 0.075, 4)
	register_grass_decoration(0,      0.06,  3)
	register_grass_decoration(0.015,  0.045, 2)
	register_grass_decoration(0.03,   0.03,  1)

	-- Dry Grasses

	register_dry_grass_decoration(0.01, 0.05,  5)
	register_dry_grass_decoration(0.03, 0.03,  4)
	register_dry_grass_decoration(0.05, 0.01,  3)
	register_dry_grass_decoration(0.07, -0.01, 2)
	register_dry_grass_decoration(0.09, -0.03, 1)

	-- Nether Grasses

	register_nether_grass_decoration(-0.03,  0.09,  5)
	register_nether_grass_decoration(-0.015, 0.075, 4)
	register_nether_grass_decoration(0,      0.06,  3)
	register_nether_grass_decoration(0.015,  0.045, 2)
	register_nether_grass_decoration(0.03,   0.03,  1)

	-- Frost Grassesmycelium

	register_frost_grass_decoration(0.01, 0.05,  5)
	register_frost_grass_decoration(0.03, 0.03,  4)
	register_frost_grass_decoration(0.05, 0.01,  3)
	register_frost_grass_decoration(0.07, -0.01, 2)
	register_frost_grass_decoration(0.09, -0.03, 1)

	-- Spring Grasses

	register_spring_grass_decoration(-0.03,  0.09,  5)
	register_spring_grass_decoration(-0.015, 0.075, 4)
	register_spring_grass_decoration(0,      0.06,  3)
	register_spring_grass_decoration(0.015,  0.045, 2)
	register_spring_grass_decoration(0.03,   0.03,  1)

	-- Mycelium Grasses

	register_mycelium_grass_decoration(0.01, 0.05,  5)
	register_mycelium_grass_decoration(0.03, 0.03,  4)
	register_mycelium_grass_decoration(0.05, 0.01,  3)
	register_mycelium_grass_decoration(0.07, -0.01, 2)
	register_mycelium_grass_decoration(0.09, -0.03, 1)

	-- Dry shrubs

	minetest.register_decoration({
		name = "default:dry_shrub",
		deco_type = "simple",
		place_on = {"default:desert_sand", "default:sand"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.035,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_max = 31000,
		y_min = 3,
		decoration = "default:dry_shrub",
		param2 = 4,
	})

	-- Papyrus

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"sandstone_ocean", "desert_ocean", "nether_grassland_ocean", "savanna_beach", "jungle_beach", "grassland_beach"},
		y_min = 1,
		y_max = 1,
		decoration = "default:papyrus",
		height = 1,
		height_max = 4,
	})

	-- Coral reef

	minetest.register_decoration({
		name = "default:corals",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 4,
		noise_params = {
			offset = -4,
			scale = 4,
			spread = {x = 50, y = 50, z = 50},
			seed = 7013,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {
			"jungle_ozean",
			"savanna_ozean",
			"grassland_ozean",
			"desert_ocean",
			"nether_grassland_ocean",
		},
		y_max = -4,
		y_min = -50,
		flags = "force_placement",
		decoration = {
			"default:coral_cyan", "default:coral_jade",
			"default:coral_green", "default:coral_blue",
			"default:coral_orange", "default:coral_pink",
			"default:coral_purble", "default:coral_red"
		},
	})

	-- Kelp

	minetest.register_decoration({
		name = "default:kelp_green",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = -0.04,
			scale = 0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 87112,
			octaves = 3,
			persist = 0.7
		},
		biomes = {
			"jungle_ocean",
			"savanna_ocean",
			"grassland_ocean",
		},
		y_max = -10,
		y_min = -50,
		flags = "force_placement",
		decoration = {
			"default:sand_with_green_kelp"
		},
		param2 = 16,
		param2_max = 144,
	})

	minetest.register_decoration({
		name = "default:kelp_red",
		deco_type = "simple",
		place_on = {"default:sand"},
		place_offset_y = -1,
		sidelen = 16,
		noise_params = {
			offset = -0.04,
			scale = 0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 87112,
			octaves = 3,
			persist = 0.7
		},
		biomes = {
			"nether_grassland_ocean",
			"desert_ocean",
		},
		y_max = -10,
		y_min = -50,
		flags = "force_placement",
		decoration = {
			"default:sand_with_red_kelp"
		},
		param2 = 16,
		param2_max = 144,
	})
end

local mgv7_spflags = minetest.get_mapgen_setting("mgv7_spflags") or
	"mountains, ridges, nofloatlands, caverns"
local captures_float = string.match(mgv7_spflags, "floatlands")
local captures_nofloat = string.match(mgv7_spflags, "nofloatlands")

default.mgv7_floatland_level =
	minetest.get_mapgen_setting("mgv7_floatland_level") or 1280
default.mgv7_shadow_limit =
	minetest.get_mapgen_setting("mgv7_shadow_limit") or 1024

minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()

default.register_biomes(default.mgv7_shadow_limit - 1)
default.register_floatland_biomes(
default.mgv7_floatland_level, default.mgv7_shadow_limit)
default.register_ores()
default.register_decorations()
