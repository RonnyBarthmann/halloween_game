--
-- misc
--

minetest.register_node("default:cloud", {
	description = "Wolke",
	tiles = {"default_cloud.png"},
	is_ground_content = false,
	stack_max = 64,
	sounds = default.node_sound_defaults(),
	groups = {not_in_creative_inventory = 1},
})

minetest.register_node("default:dirt_with_grass_footsteps", {
	description = "Fussabdruecke",
	tiles = {"default_dirt_with_grass_top.png^default_footprint.png", "default_dirt_top.png",
		{name = "default_dirt_side.png^default_dirt_with_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1},
	stack_max = 64,
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:lava_light", {
	description = "Lavalicht",
	tiles = {"default_lava_light.png"},
	paramtype = "light",
	stack_max = 64,
	sunlight_propagates = true,
	is_ground_content = false,
	light_source = default.LIGHT_MAX,
	groups = {cracky = 3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:water_light", {
	description = "Wasserlicht",
	tiles = {"default_water_light.png"},
	paramtype = "light",
	stack_max = 64,
	sunlight_propagates = true,
	is_ground_content = false,
	light_source = default.LIGHT_MAX,
	groups = {cracky = 3},
	sounds = default.node_sound_glass_defaults(),
})

--
-- Snowy
--

minetest.register_node("default:snow", {
	description = "Schnee",
	tiles = {"default_dirt_with_snow_top.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	walkable = false,
	stack_max = 64,
	groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1, snowy_grass = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),
})

minetest.register_node("default:snowblock", {
	description = "Schneeblock",
	tiles = {"default_dirt_with_snow_top.png"},
	stack_max = 64,
	groups = {crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy_grass = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),
})

minetest.register_node("default:ice", {
	description = "Eis",
	drawtype = "glasslike",
	tiles = {"default_ice.png"},
	stack_max = 64,
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = false,
	groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1, frost_grass = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:packed_ice", {
	description = "Packeis",
	tiles = {"default_packed_ice.png"},
	stack_max = 64,
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 2, puts_out_fire = 1, cools_lava = 1, frost_grass = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:river_ice", {
	description = "Flusseis",
	drawtype = "glasslike",
	tiles = {"default_river_ice.png"},
	stack_max = 64,
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = false,
	groups = {cracky = 3, puts_out_fire = 1, cools_lava = 1, frost_grass = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:river_packed_ice", {
	description = "Flusspackeis",
	tiles = {"default_river_packed_ice.png"},
	stack_max = 64,
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 2, puts_out_fire = 1, cools_lava = 1, frost_grass = 1},
	sounds = default.node_sound_glass_defaults(),
})

--
-- Dirt
--

minetest.register_node("default:dirt", {
	description = "Erde",
	tiles = {"default_dirt_top.png", "default_dirt_top.png", "default_dirt_side.png"},
	stack_max = 64,
	groups = {crumbly = 2, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:coarse_dirt", {
	description = "Grobe Erde",
	tiles = {"default_coarse_dirt_top.png", "default_coarse_dirt_top.png", "default_coarse_dirt_side.png"},
	stack_max = 64,
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:dirt_with_spring_grass", {
	description = "Fruchtbarer Grasblock",
	tiles = {"default_dirt_with_spring_grass_top.png", "default_dirt_top.png",
		{name = "default_dirt_side.png^default_dirt_with_spring_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, spring_grass = 1},
	drop = 'default:dirt',
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_grass", {
	description = "Grasblock",
	tiles = {"default_dirt_with_grass_top.png", "default_dirt_top.png",
		{name = "default_dirt_side.png^default_dirt_with_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, grass = 1},
	drop = 'default:dirt',
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_dry_grass", {
	description = "Trockener Grasblock",
	tiles = {"default_dirt_with_dry_grass_top.png", "default_dirt_top.png",
		{name = "default_dirt_side.png^default_dirt_with_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, dry_grass = 1},
	drop = 'default:dirt',
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_podzol", {
	description = "Tropen Grasblock",
	tiles = {"default_dirt_with_podzol_top.png", "default_dirt_top.png",
		{name = "default_dirt_side.png^default_dirt_with_podzol_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, jungle_grass = 1},
	drop = 'default:dirt',
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_mycelium", {
	description = "Pilz Grasblock",
	tiles = {"default_dirt_with_mycelium_top.png", "default_dirt_top.png",
		{name = "default_dirt_side.png^default_dirt_with_mycelium_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, mycelium_grass = 1},
	drop = 'default:dirt',
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_nether_grass", {
	description = "Nether Grasblock",
	tiles = {"default_dirt_with_nether_grass_top.png", "default_dirt_top.png",
		{name = "default_dirt_side.png^default_dirt_with_nether_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, nether_grass = 1},
	drop = 'default:dirt',
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_frost_grass", {
	description = "Vereister Grasblock",
	tiles = {"default_dirt_with_frost_grass_top.png", "default_dirt_top.png",
		{name = "default_dirt_side.png^default_dirt_with_frost_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, frost_grass = 1},
	drop = 'default:dirt',
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:dirt_with_snow", {
	description = "Verschneiter Grasblock",
	tiles = {"default_dirt_with_snow_top.png", "default_dirt_top.png",
		{name = "default_dirt_side.png^default_dirt_with_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1, snowy_grass = 1},
	drop = 'default:dirt',
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("default:gravel", {
	description = "Kies",
	tiles = {"default_gravel.png"},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:flint'}, rarity = 20},
			{items = {'default:gravel'}}
		}
	},
	stack_max = 64,
	groups = {crumbly = 1, falling_node = 1},
	sounds = default.node_sound_gravel_defaults(),
})

minetest.register_node("default:clay", {
	description = "Lehm",
	tiles = {"default_clay.png"},
	stack_max = 64,
	drop = 'default:clay_lump 4',
	groups = {crumbly = 3, clay = 1},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("default:lime", {
	description = "Kalk",
	tiles = {"default_lime.png"},
	stack_max = 64,
	drop = 'default:lime_lump 4',
	groups = {crumbly = 3, lime = 1},
	sounds = default.node_sound_dirt_defaults(),
})

--
-- Stone
--

minetest.register_node("default:silver_sand", {
	description = "Silbersand",
	tiles = {"default_silver_sand.png"},
	stack_max = 64,
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:cobble", {
	description = "Bruchstein",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 3, cobble = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mossycobble", {
	description = "Bemooster Bruchstein",
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 3, cobble = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:diorite", {
	description = "Diorit",
	tiles = {"default_diorite.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {cracky= 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:diorite_smooth", {
	description = "Polierter Diorit",
	tiles = {"default_diorite_smooth.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky= 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone", {
	description = "Stein",
	tiles = {"default_stone.png"},
	legacy_mineral = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'default:stone'}, rarity = 15},
			{items = {'default:cobble'}}
		}
	},
	stack_max = 64,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:runestone", {
	description = "Gemeisselter Steinziegel",
	tiles = {"default_runestone.png"},
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sand", {
	description = "Sand",
	tiles = {"default_sand.png"},
	stack_max = 64,
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:sandcobble", {
	description = "Sandiger Bruchstein",
	tiles = {"default_sandcobble.png"},
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, cobble = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mossy_sandcobble", {
	description = "Bemooster Sandbruchstein",
	tiles = {"default_mossy_sandcobble.png"},
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, cobble = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:andesite", {
	description = "Andesit",
	tiles = {"default_andesite.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {cracky= 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:andesite_smooth", {
	description = "Polierter Andesit",
	tiles = {"default_andesite_smooth.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky= 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone", {
	description = "Sandstein",
	tiles = {"default_sandstone.png"},
	stack_max = 64,
	legacy_mineral = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'default:sandstone'}, rarity = 15},
			{items = {'default:sandcobble'}}
		}
	},
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_sand", {
	description = "Wuestensand",
	tiles = {"default_desert_sand.png"},
	stack_max = 64,
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:desert_cobble", {
	description = "Wuestenbruchstein",
	tiles = {"default_desert_cobble.png"},
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, cobble = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mossy_desert_cobble", {
	description = "Bemooster Wuestenbruchstein",
	tiles = {"default_mossy_desert_cobble.png"},
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, cobble = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:granite", {
	description = "Granit",
	tiles = {"default_granite.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {cracky= 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:granite_smooth", {
	description = "Polierter Granit",
	tiles = {"default_granite_smooth.png"},
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky= 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone", {
	description = "Wuestenstein",
	tiles = {"default_desert_stone.png"},
	stack_max = 64,
	legacy_mineral = true,
	drop = {
		max_items = 1,
		items = {
			{items = {'default:desert_stone'}, rarity = 15},
			{items = {'default:desert_cobble'}}
		}
	},
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:glass", {
	description = "Glas",
	drawtype = "glasslike",
	tiles = {"default_glass.png^default_glassframe.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	sunlight_propagates = true,
	use_texture_alpha = true,
	groups = {cracky = 3, oddly_breakable_by_hand = 3, glass = 1},
	sounds = default.node_sound_glass_defaults(),
})

--
-- Wood
--

minetest.register_node("default:coal_wood", {
	description = "Verbrannte Holzbretter",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_coal_wood.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 3, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:frost_wood", {
	description = "Gefrohrene Holzbretter",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_frost_wood.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 3, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:wood", {
	description = "Holzbretter",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_wood.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:junglewood", {
	description = "Tropenholzbretter",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_junglewood.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:pine_wood", {
	description = "Fichtenholzbretter",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_pine_wood.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:aspen_wood", {
	description = "Birkenholzbretter",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_aspen_wood.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:acacia_wood", {
	description = "Akazienholzbretter",
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"default_acacia_wood.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
	sounds = default.node_sound_wood_defaults(),
})