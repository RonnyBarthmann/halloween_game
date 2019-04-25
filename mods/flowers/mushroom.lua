minetest.register_node("flowers:mushroom_stemp", {
	description = "Pilzstengel",
	tiles = {"flowers_mushroom_stemp_top.png", "flowers_mushroom_stemp_top.png", "flowers_mushroom_stemp.png"},
	paramtype2 = "facedir",
	stack_max = 64,
	is_ground_content = false,
	groups = {fleshy = 3, oddly_breakable_by_hand = 2, flammable = 1, tree = 1, not_cutable = 1},
	sounds = default.node_sound_dirt_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("flowers:mushroom_stemp_brown", {
	description = "Pilzstengel",
	tiles = {"flowers_mushroom_stemp_top.png", "flowers_mushroom_stemp_top.png", "flowers_mushroom_stemp.png"},
	paramtype2 = "facedir",
	stack_max = 64,
	drop = {"flowers:mushroom_stemp"},
	is_ground_content = false,
	groups = {fleshy = 3, oddly_breakable_by_hand = 2, flammable = 1, tree = 1, not_in_creative_inventory = 1, not_cutable = 1},
	sounds = default.node_sound_dirt_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("flowers:mushroom_stemp_purble", {
	description = "Pilzstengel",
	tiles = {"flowers_mushroom_stemp_top.png", "flowers_mushroom_stemp_top.png", "flowers_mushroom_stemp.png"},
	paramtype2 = "facedir",
	stack_max = 64,
	drop = {"flowers:mushroom_stemp"},
	is_ground_content = false,
	groups = {fleshy = 3, oddly_breakable_by_hand = 2, flammable = 1, tree = 1, not_in_creative_inventory = 1, not_cutable = 1},
	sounds = default.node_sound_dirt_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("flowers:brown_mushroom_block", {
	description = "Brauner Pilzblock",
	tiles = {"flowers_brown_mushroom_block.png"},
	paramtype = "light",
	is_ground_content = false,
	stack_max = 64,
	groups = {fleshy = 3, oddly_breakable_by_hand = 2, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'flowers:mushroom_brown'}, rarity = 20},
			{items = {'flowers:brown_mushroom_block'}}
		}
	},
	sounds = default.node_sound_dirt_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("flowers:purble_mushroom_block", {
	description = "Lilaner Pilzblock",
	tiles = {"flowers_purble_mushroom_block.png"},
	paramtype = "light",
	is_ground_content = false,
	stack_max = 64,
	groups = {fleshy = 3, oddly_breakable_by_hand = 2, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'flowers:mushroom_purble'}, rarity = 20},
			{items = {'flowers:purble_mushroom_block'}}
		}
	},
	sounds = default.node_sound_dirt_defaults(),

	after_place_node = default.after_place_leaves,
})

default.register_leafdecay({
	trunks = {"flowers:mushroom_stemp_purble"},
	leaves = {"flowers:purble_mushroom_block"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"flowers:mushroom_stemp_brown"},
	leaves = {"flowers:brown_mushroom_block"},
	radius = 3,
})