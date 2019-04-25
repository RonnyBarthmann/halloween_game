minetest.register_node("farming:beetroot_0", {
	description = "Rote Beete",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_beetroot_0.png"},
	inventory_image = "farming_beetroot_0.png",
	wield_image = "farming_beetroot_0.png",
	drop = "farming:beetroot_item",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -5/16, 0.5}
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:beetroot_1", {
	description = "Rote Beete",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_beetroot_1.png"},
	inventory_image = "farming_beetroot_1.png",
	wield_image = "farming_beetroot_1.png",
	drop = "farming:beetroot_item",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -3/16, 0.5}
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:beetroot_2", {
	description = "Rote Beete",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_beetroot_2.png"},
	inventory_image = "farming_beetroot_2.png",
	wield_image = "farming_beetroot_2.png",
	drop = "farming:beetroot_item",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 2/16, 0.5}
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:beetroot", {
	description = "Rote Beete",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	drop = {
		items = {
			{ items = {'farming:beetroot_item'} },
			{ items = {'farming:beetroot_item 2'}, rarity = 1 },
			{ items = {'farming:beetroot_item 3'}, rarity = 3 }
		}
	},
	tiles = {"farming_beetroot_3.png"},
	inventory_image = "farming_beetroot_3.png",
	wield_image = "farming_beetroot_3.png",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 3/16, 0.5}
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming:beetroot_item", {
	description = "Rote Beete",
	inventory_image = "farming_beetroot.png",
	wield_image = "farming_beetroot.png",
	stack_max = 64,
	on_use = minetest.item_eat(1),
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "farming:beetroot_0")
	end
})

farming:add_plant("plant_beetroot", "farming:beetroot", {"farming:beetroot_0", "farming:beetroot_1", "farming:beetroot_2"}, 25, 20)
