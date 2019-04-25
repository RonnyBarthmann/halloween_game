minetest.register_node("farming:potato_0", {
	description = "Kartoffel",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_potato_stage_0.png"},
	inventory_image = "farming_potato_stage_0.png",
	wield_image = "farming_potato_stage_0.png",
	drop = "farming:potato_item",
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, -5/16, 0.5 }
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:potato_1", {
	description = "Kartoffel",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_potato_stage_1.png"},
	inventory_image = "farming_potato_stage_1.png",
	wield_image = "farming_potato_stage_1.png",
	drop = "farming:potato_item",
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, -2/16, 0.5 }
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:potato_2", {
	description = "Kartoffel",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	tiles = {"farming_potato_stage_2.png"},
	inventory_image = "farming_potato_stage_2.png",
	wield_image = "farming_potato_stage_2.png",
	drop = "farming:potato_item",
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 2/16, 0.5 }
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:potato", {
	description = "Kartoffel",
	waving = 1,
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drawtype = "plantlike",
	drop = {
		items = {
			{ items = {'farming:potato_item'} },
			{ items = {'farming:potato_item 2'}, rarity = 1 },
			{ items = {'farming:potato_item 3'}, rarity = 3 }
		}
	},
	tiles = {"farming_potato_stage_3.png"},
	inventory_image = "farming_potato_stage_3.png",
	wield_image = "farming_potato_stage_3.png",
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.5, 0.5, 1/16, 0.5 }
		},
	},
	groups = {snappy = 3, flora = 1, attached_node = 1, not_in_creative_inventory=1, plant=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming:potato_item", {
	description = "Kartoffel",
	inventory_image = "farming_potato.png",
	wield_image = "farming_potato.png",
	stack_max = 64,
	on_use = minetest.item_eat(2),
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "farming:potato_0")
	end
})

minetest.register_craftitem("farming:baked_potato", {
	description = "Ofenkartoffel",
	inventory_image = "farming_baked_potato.png",
	on_use = minetest.item_eat(4),
	stack_max = 64,
})

minetest.register_craftitem("farming:potato_gold", {
	description = "Goldene Kartoffel",
	inventory_image = "farming_potato_gold.png",
	stack_max = 64,
})

farming:add_plant("plant_potato", "farming:potato", {"farming:potato_0", "farming:potato_1", "farming:potato_2"}, 19.75, 20)