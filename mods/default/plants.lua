minetest.register_node("default:coal_tree", {
	description = "Holzkohle",
	tiles = {"default_coal_tree_top.png", "default_coal_tree_top.png", "default_coal_tree.png"},
	paramtype2 = "facedir",
	stack_max = 64,
	is_ground_content = false,
	groups = {choppy = 2, flammable = 1, oddly_breakable_by_hand = 1, tree = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:frost_tree", {
	description = "Gefrohrenes Holz",
	tiles = {"default_frost_tree_top.png", "default_frost_tree_top.png", "default_frost_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, tree = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:tree", {
	description = "Holz",
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1, tree = 1},
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node
})

minetest.register_node("default:jungletree", {
	description = "Tropenholz",
	tiles = {"default_jungle_tree_top.png", "default_jungle_tree_top.png", "default_jungle_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1, tree = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("default:pine_tree", {
	description = "Fichtenholz",
	tiles = {"default_pine_tree_top.png", "default_pine_tree_top.png", "default_pine_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1, tree = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("default:aspen_tree", {
	description = "Birkenholz",
	tiles = {"default_aspen_tree_top.png", "default_aspen_tree_top.png", "default_aspen_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1, tree = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("default:acacia_tree", {
	description = "Akazienholz",
	tiles = {"default_acacia_tree_top.png", "default_acacia_tree_top.png", "default_acacia_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	stack_max = 64,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 1, tree = 1},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("default:leaves", {
	description = "Laub",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	stack_max = 64,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:sapling'}, rarity = 20},
			{items = {'default:leaves'}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:jungleleaves", {
	description = "Tropenlaub",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_jungle_leaves.png"},
	special_tiles = {"default_jungle_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	stack_max = 64,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'farming:cocoa_beans'}, rarity = 20},
			{items = {'default:junglesapling'}, rarity = 15},
			{items = {'default:jungleleaves'}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:pine_needles", {
	description = "Fichtennadeln",
	drawtype = "allfaces_optional",
	tiles = {"default_pine_needles.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	drop = {
		max_items = 1,
		items = {
			{items = {"default:pine_sapling"}, rarity = 20},
			{items = {"default:pine_needles"}}
		}
	},
	stack_max = 64,
	groups = {snappy = 2, leafdecay = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:aspen_leaves", {
	description = "Birkenlaub",
	drawtype = "allfaces_optional",
	tiles = {"default_aspen_leaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	stack_max = 64,
	drop = {
		max_items = 1,
		items = {
			{items = {"default:aspen_sapling"}, rarity = 20},
			{items = {"default:aspen_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:acacia_leaves", {
	description = "Akazienlaub",
	drawtype = "allfaces_optional",
	tiles = {"default_acacia_leaves.png"},
	special_tiles = {"default_acacia_leaves_simple.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	stack_max = 64,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:acacia_sapling"}, rarity = 20},
			{items = {"default:acacia_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:sapling", {
	description = "Setzling",
	drawtype = "plantlike",
	tiles = {"default_sapling.png"},
	inventory_image = "default_sapling.png",
	wield_image = "default_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	stack_max = 64,
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:sapling",
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			4)

		return itemstack
	end,
})

minetest.register_node("default:junglesapling", {
	description = "Tropensetzling",
	drawtype = "plantlike",
	tiles = {"default_jungle_sapling.png"},
	inventory_image = "default_jungle_sapling.png",
	wield_image = "default_jungle_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	stack_max = 64,
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, flammable = 2, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:junglesapling",
			{x = -2, y = 1, z = -2},
			{x = 2, y = 15, z = 2},
			4)

		return itemstack
	end,
})

minetest.register_node("default:pine_sapling", {
	description = "Fichtensetzling",
	drawtype = "plantlike",
	tiles = {"default_pine_sapling.png"},
	inventory_image = "default_pine_sapling.png",
	wield_image = "default_pine_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	stack_max = 64,
	groups = {snappy = 2, dig_immediate = 3, flammable = 3, attached_node = 1, flammable = 2, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:pine_sapling",
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			4)

		return itemstack
	end,
})

minetest.register_node("default:aspen_sapling", {
	description = "Birkensetzling",
	drawtype = "plantlike",
	tiles = {"default_aspen_sapling.png"},
	inventory_image = "default_aspen_sapling.png",
	wield_image = "default_aspen_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 0.5, 3 / 16}
	},
	stack_max = 64,
	groups = {snappy = 2, dig_immediate = 3, flammable = 3, attached_node = 1, flammable = 2, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:aspen_sapling",
			{x = -2, y = 1, z = -2},
			{x = 2, y = 12, z = 2},
			4)

		return itemstack
	end,
})

minetest.register_node("default:acacia_sapling", {
	description = "Akaziensetzling",
	drawtype = "plantlike",
	tiles = {"default_acacia_sapling.png"},
	inventory_image = "default_acacia_sapling.png",
	wield_image = "default_acacia_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
	},
	stack_max = 64,
	groups = {snappy = 2, dig_immediate = 3, flammable = 2, attached_node = 1, flammable = 2, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:acacia_sapling",
			{x = -4, y = 1, z = -4},
			{x = 4, y = 6, z = 4},
			4)

		return itemstack
	end,
})

minetest.register_node("default:apple", {
	description = "Fauliger Apfel",
	drawtype = "plantlike",
	tiles = {"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -7 / 16, -3 / 16, 3 / 16, 4 / 16, 3 / 16}
	},
	stack_max = 64,
	groups = {snappy = 3, dig_immediate = 3, flammable = 2, leafdecay = 3, leafdecay_drop = 1},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		minetest.set_node(pos, {name = "default:apple", param2 = 1})
	end,
})

minetest.register_node("default:junglegrass", {
	description = "Tropengras",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.69,
	tiles = {"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 64,
	drop = {
		max_items = 1,
		items = {
			{items = {'farming:cotton_seeds'}, rarity = 15},
			{items = {'default:junglegrass'}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1, jungle_grass = 1, color_lime = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("default:fern", {
	description = "Farn",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_fern.png"},
	inventory_image = "default_fern.png",
	wield_image = "default_fern.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 64,
	drop = {
		max_items = 1,
		items = {
			{items = {'farming:hemp_seeds'}, rarity = 15},
			{items = {'default:fern'}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1, grass = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
	},
})

minetest.register_node("default:netherflower", {
	description = "Feuerblume",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_netherflower.png"},
	inventory_image = "default_netherflower.png",
	wield_image = "default_netherflower.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 64,
	drop = {
		max_items = 1,
		items = {
			{items = {'default:lava_dust 4'}, rarity = 15},
			{items = {'default:netherflower'}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1, nether_grass = 1, color_dark_red = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("default:frostflower", {
	description = "Eisblume",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_frostflower.png"},
	inventory_image = "default_frostflower.png",
	wield_image = "default_frostflower.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 64,
	drop = {
		max_items = 1,
		items = {
			{items = {'default:water_dust 4'}, rarity = 15},
			{items = {'default:frostflower'}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, flammable = 1, frost_grass = 1, color_night = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
})

minetest.register_node("default:grass_1", {
	description = "Gras",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_grass_1.png"},
	inventory_image = "default_grass_3.png",
	wield_image = "default_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 64,
	drop = {
		max_items = 1,
		items = {
			{items = {'farming:wheat_seeds'}, rarity = 15},
			{items = {'default:grass_1'}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, color_dark_green = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("default:grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("default:grass_" .. i, {
		description = "Gras",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_grass_" .. i .. ".png"},
		inventory_image = "default_grass_" .. i .. ".png",
		wield_image = "default_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		stack_max = 64,
		drop = {
			max_items = 1,
			items = {
				{items = {'farming:wheat_seeds'}, rarity = 15},
				{items = {'default:grass_1'}}
			}
		},
		groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory = 1, grass = 1, color_dark_green = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

minetest.register_node("default:spring_grass_1", {
	description = "Frisches Gras",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_spring_grass_1.png"},
	inventory_image = "default_spring_grass_3.png",
	wield_image = "default_spring_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 64,
	drop = {
		max_items = 1,
		items = {
			{items = {'farming:hemp_seeds'}, rarity = 15},
			{items = {'default:spring_grass_1'}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, color_lime = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		local stack = ItemStack("default:spring_grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:spring_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("default:spring_grass_" .. i, {
		description = "Frisches Gras",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_spring_grass_" .. i .. ".png"},
		inventory_image = "default_spring_grass_" .. i .. ".png",
		wield_image = "default_spring_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		stack_max = 64,
		drop = {
			max_items = 1,
			items = {
				{items = {'farming:hemp_seeds'}, rarity = 15},
				{items = {'default:spring_grass_1'}}
			}
		},
		groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory = 1, grass = 1, color_lime = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

minetest.register_node("default:dry_shrub", {
	description = "Toter Strauch",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_bush_stem.png"},
	inventory_image = "default_bush_stem.png",
	wield_image = "default_bush_stem.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "default:stick",
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
	},
})

minetest.register_node("default:dry_grass_1", {
	description = "Vertrocknetes Gras",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_dry_grass_1.png"},
	inventory_image = "default_dry_grass_3.png",
	wield_image = "default_dry_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 64,
	drop = {
		max_items = 1,
		items = {
			{items = {'farming:wheat_seeds'}, rarity = 15},
			{items = {'default:dry_grass_1'}}
		}
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, dry_grass = 1, color_gold = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random dry grass node
		local stack = ItemStack("default:dry_grass_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:dry_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("default:dry_grass_" .. i, {
		description = "Vertrocknetes Gras",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_dry_grass_" .. i .. ".png"},
		inventory_image = "default_dry_grass_" .. i .. ".png",
		wield_image = "default_dry_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		stack_max = 64,
		drop = {
			max_items = 1,
			items = {
				{items = {'farming:wheat_seeds'}, rarity = 15},
				{items = {'default:dry_grass_1'}}
			}
		},
		groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, dry_grass = 1, color_gold = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -1 / 16, 6 / 16},
		},
	})
end

minetest.register_node("default:mycelium_grass_1", {
	description = "Fluoreszierendes Gras",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_mycelium_grass_1.png"},
	inventory_image = "default_mycelium_grass_3.png",
	wield_image = "default_mycelium_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	light_source = default.LIGHT_MAX -11,
	stack_max = 64,
	drop = "default:mycelium_grass_1",
	groups = {snappy = 3, flora = 1, attached_node = 1, mycelium = 1, color_purble = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -5 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("default:mycelium_grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:mycelium_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("default:mycelium_grass_" .. i, {
		description = "Fluoreszierendes Gras",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_mycelium_grass_" .. i .. ".png"},
		inventory_image = "default_mycelium_grass_" .. i .. ".png",
		wield_image = "default_mycelium_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		light_source = default.LIGHT_MAX -11,
		stack_max = 64,
		drop = "default:mycelium_grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory = 1, mycelium = 1, color_purble = 1},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
		},
	})
end

minetest.register_node("default:nether_grass_1", {
	description = "Nethergras",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_nether_grass_1.png"},
	inventory_image = "default_nether_grass_3.png",
	wield_image = "default_nether_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 64,
	groups = {snappy = 3, flora = 1, attached_node = 1, nether_grass = 1, color_red = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random dry grass node
		local stack = ItemStack("default:nether_grass_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:nether_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("default:nether_grass_" .. i, {
		description = "Nethergras",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_nether_grass_" .. i .. ".png"},
		inventory_image = "default_nether_grass_" .. i .. ".png",
		wield_image = "default_nether_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		stack_max = 64,
		groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, nether_grass = 1, color_red = 1},
		drop = "default:nether_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -1 / 16, 6 / 16},
		},
	})
end

minetest.register_node("default:frost_grass_1", {
	description = "Vereistes Gras",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_frost_grass_1.png"},
	inventory_image = "default_frost_grass_3.png",
	wield_image = "default_frost_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	stack_max = 64,
	groups = {snappy = 3, flora = 1, attached_node = 1, frost_grass = 1, color_blue = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -3 / 16, 6 / 16},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random dry grass node
		local stack = ItemStack("default:frost_grass_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:frost_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
})

for i = 2, 5 do
	minetest.register_node("default:frost_grass_" .. i, {
		description = "Vereistes Gras",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_frost_grass_" .. i .. ".png"},
		inventory_image = "default_frost_grass_" .. i .. ".png",
		wield_image = "default_frost_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		stack_max = 64,
		groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, frost_grass = 1, color_blue = 1},
		drop = "default:frost_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -1 / 16, 6 / 16},
		},
	})
end

minetest.register_node("default:cactus", {
	description = "Kaktus",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.4375, 0.4375, 0.5, 0.4375},
			{-0.3125, -0.5, -0.5, -0.3125, 0.5, 0.5},
			{0.3125, -0.5, -0.5, 0.3125, 0.5, 0.5},
			{-0.5, -0.5, -0.3125, 0.5, 0.5, -0.3125},
			{-0.5, -0.5, 0.3125, 0.5, 0.5, 0.3125},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
			}
	},
	tiles = {"default_cactus_top.png",
		"default_cactus_buttom.png",
		"default_cactus_side.png"
	},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, not_cutable = 1},
	stack_max = 64,
	sounds = default.node_sound_wood_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
	on_walk_over = function(loc, nodeiamon, player)
		if player:get_hp() > 0 then
			player:set_hp(player:get_hp() - 1)
		end
	end,
})

minetest.register_node("default:papyrus", {
	description = "Zuckerrohr",
	drawtype = "plantlike",
	tiles = {"default_papyrus.png"},
	inventory_image = "default_papyrus_inv.png",
	wield_image = "default_papyrus_inv.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 0.5, 6 / 16},
	},
	stack_max = 64,
	groups = {snappy = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_leaves_defaults(),

	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

minetest.register_node("default:bush_stem", {
	description = "Buschstamm",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_bush_stem.png"},
	inventory_image = "default_bush_stem.png",
	wield_image = "default_bush_stem.png",
	stack_max = 64,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, bushstemp = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("default:bush_leaves", {
	description = "Buschlaub",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png"},
	stack_max = 64,
	paramtype = "light",
	groups = {snappy = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:bush_sapling"}, rarity = 5},
			{items = {"default:bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:bush_sapling", {
	description = "Buschsetzling",
	drawtype = "plantlike",
	tiles = {"default_bush_sapling.png"},
	inventory_image = "default_bush_sapling.png",
	wield_image = "default_bush_sapling.png",
	stack_max = 64,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 3, oddly_breakable_by_hand = 3, dig_immediate = 3, attached_node = 1, flammable = 2, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:bush_sapling",
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			2)

		return itemstack
	end,
})

minetest.register_node("default:acacia_bush_stem", {
	description = "Akazienbuschstamm",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_acacia_bush_stem.png"},
	inventory_image = "default_acacia_bush_stem.png",
	wield_image = "default_acacia_bush_stem.png",
	stack_max = 64,
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, bushstemp = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("default:acacia_bush_leaves", {
	description = "Akazienbuschlaub",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_acacia_leaves.png"},
	stack_max = 64,
	paramtype = "light",
	groups = {snappy = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:acacia_bush_sapling"}, rarity = 5},
			{items = {"default:acacia_bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:acacia_bush_sapling", {
	description = "Akazienbuschsetzling",
	drawtype = "plantlike",
	tiles = {"default_acacia_bush_sapling.png"},
	inventory_image = "default_acacia_bush_sapling.png",
	wield_image = "default_acacia_bush_sapling.png",
	stack_max = 64,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 2 / 16, 3 / 16}
	},
	groups = {snappy = 3, oddly_breakable_by_hand = 3, dig_immediate = 3, attached_node = 1, flammable = 2, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:acacia_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_node("default:pine_bush_stem", {
	description = "Nadelbuschstamm",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_acacia_bush_stem.png"},
	inventory_image = "default_acacia_bush_stem.png",
	wield_image = "default_acacia_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	stack_max = 64,
	groups = {choppy = 3, oddly_breakable_by_hand = 3, bushstemp = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
	},
})

minetest.register_node("default:pine_bush_needles", {
	description = "Buschnadeln",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_pine_bush_needles.png"},
	paramtype = "light",
	stack_max = 64,
	groups = {snappy = 3, leaves = 1, flammable = 2},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:pine_bush_sapling"}, rarity = 5},
			{items = {"default:pine_bush_needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:pine_bush_sapling", {
	description = "Nadelbuschsetzling",
	drawtype = "plantlike",
	tiles = {"default_pine_bush_sapling.png"},
	inventory_image = "default_pine_bush_sapling.png",
	wield_image = "default_pine_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	stack_max = 64,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 3, oddly_breakable_by_hand = 3, dig_immediate = 3, attached_node = 1, flammable = 2, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(300, 1500))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:pine_bush_sapling",
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			2)

		return itemstack
	end,
})

default.register_leafdecay({
	trunks = {"default:tree"},
	leaves = {"default:apple", "default:leaves"},
	radius = 3,
})

default.register_leafdecay({
	trunks = {"default:pine_tree"},
	leaves = {"default:pine_needles"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:jungletree"},
	leaves = {"default:jungleleaves"},
	radius = 3,
})

default.register_leafdecay({
	trunks = {"default:acacia_tree"},
	leaves = {"default:acacia_leaves"},
	radius = 2,
})

default.register_leafdecay({
	trunks = {"default:aspen_tree"},
	leaves = {"default:aspen_leaves"},
	radius = 3,
})

default.register_leafdecay({
	trunks = {"default:bush_stem"},
	leaves = {"default:bush_leaves"},
	radius = 1,
})

default.register_leafdecay({
	trunks = {"default:pine_bush_stem"},
	leaves = {"default:pine_bush_needles"},
	radius = 1,
})

default.register_leafdecay({
	trunks = {"default:acacia_bush_stem"},
	leaves = {"default:acacia_bush_leaves"},
	radius = 1,
})