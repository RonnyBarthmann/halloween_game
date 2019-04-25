minetest.register_node("farming:carrot_0", {
	description = "Karotte",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_carrot_0.png"},
	inventory_image = "farming_carrot_0.png",
	wield_image = "farming_carrot_0.png",
	drop = "farming:carrot_item",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:carrot_1", {
	description = "Karotte",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_carrot_1.png"},
	inventory_image = "farming_carrot_1.png",
	wield_image = "farming_carrot_1.png",
	drop = "farming:carrot_item",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -3/16, 0.5}
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:carrot_2", {
	description = "Karotte",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_carrot_2.png"},
	inventory_image = "farming_carrot_2.png",
	wield_image = "farming_carrot_2.png",
	drop = "farming:carrot_item",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 2/16, 0.5}
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:carrot", {
	description = "Karotte",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	drop = {
		items = {
			{ items = {'farming:carrot_item'} },
			{ items = {'farming:carrot_item 2'}, rarity = 1 },
			{ items = {'farming:carrot_item 3'}, rarity = 3 }
		}
	},
	tiles = {"farming_carrot_3.png"},
	inventory_image = "farming_carrot_3.png",
	wield_image = "farming_carrot_3.png",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 4/16, 0.5}
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming:carrot_item", {
	description = "Karotte",
	inventory_image = "farming_carrot.png",
	wield_image = "farming_carrot.png",
	stack_max = 64,
	on_use = minetest.item_eat(2),
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "farming:carrot_0")
	end,
	groups = {food = 1}
})

minetest.register_craftitem("farming:carrot_gold", {
	description = "Goldene Karotte",
	inventory_image = "farming_carrot_gold.png",
	stack_max = 64,
})

farming:add_plant("plant_carrot", "farming:carrot", {"farming:carrot_0", "farming:carrot_1", "farming:carrot_2"}, 25, 20)