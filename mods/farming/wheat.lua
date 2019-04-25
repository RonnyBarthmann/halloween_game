minetest.register_craftitem("farming:wheat_seeds", {
	description = "Weizensaat",
	inventory_image = "farming_wheat_seed.png",
	stack_max = 64,
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "farming:wheat_1")
	end,
	groups = {flora = 1}
})

local sel_heights = {
	-5/16,
	-2/16,
	0,
	3/16,
	5/16,
	6/16,
	7/16,
}

for i=1,7 do
	local create, name
	if i == 1 then
		create = true
		name = "Weizen"
	else
		create = false
	end

	minetest.register_node("farming:wheat_"..i, {
		description = "Weizen",
		waving = 1,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		drawtype = "nodebox",
		visual_scale = 1.14,
		drop = "farming:wheat_seeds",
		tiles = {"farming_wheat_stage_"..(i-1)..".png"},
		inventory_image = "farming_wheat_stage_"..(i-1)..".png",
		wield_image = "farming_wheat_stage_"..(i-1)..".png",
		drop = "farming:wheat_seeds",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.5, -0.25, 0.5, 0.5},
				{0.25, -0.5, -0.5, 0.25, 0.5, 0.5},
				{-0.5, -0.5, 0.25, 0.5, 0.5, 0.25},
				{-0.5, -0.5, -0.25, 0.5, 0.5, -0.25},
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, sel_heights[i], 0.5}
			},
		},
		groups = {snappy=3, not_in_creative_inventory=1, flora = 1, plant=1, attached_node=1},
		sounds = default.node_sound_leaves_defaults(),
	})
end

minetest.register_node("farming:wheat", {
	description = "Weizen",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	drawtype = "nodebox",
	visual_scale = 1.14,
	tiles = {"farming_wheat_stage_7.png"},
	inventory_image = "farming_wheat_stage_7.png",
	wield_image = "farming_wheat_stage_7.png",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.5, -0.25, 0.5, 0.5},
			{0.25, -0.5, -0.5, 0.25, 0.5, 0.5},
			{-0.5, -0.5, 0.25, 0.5, 0.5, 0.25},
			{-0.5, -0.5, -0.25, 0.5, 0.5, -0.25},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
		},
	},
	drop = {
		items = {
			{ items = {'farming:wheat_item 2'}},
			{ items = {'farming:wheat_item 4'}, rarity = 3 },
			{ items = {'farming:wheat_seeds 1'}},
			{ items = {'farming:wheat_seeds 2'}, rarity = 3 }
		}
	},
	groups = {snappy=3, not_in_creative_inventory=1, plant=1, flora = 1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

farming:add_plant("plant_wheat", "farming:wheat", {"farming:wheat_1", "farming:wheat_2", "farming:wheat_3", "farming:wheat_4", "farming:wheat_5", "farming:wheat_6", "farming:wheat_7"}, 68, 3)

minetest.register_craftitem("farming:wheat_item", {
	description = "Weizen",
	inventory_image = "farming_wheat_harvested.png",
	stack_max = 64,
	groups = {flora = 1}
})

minetest.register_node("farming:straw", {
	description = "Strohballen",
	tiles = {"farming_straw_top.png", "farming_straw_top.png", "farming_straw_side.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {snappy = 2, flora = 1, fence_connect = 1, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craftitem("farming:flour", {
	description = "Mehl",
	inventory_image = "farming_flour.png",
	stack_max = 64,
	groups = {food = 1}
})

minetest.register_craftitem("farming:bread_with_worm", {
	description = "Gammeliges Brot",
	inventory_image = "farming_bread_with_worm.png",
	stack_max = 64,
	groups = {food = 1}
})

minetest.register_craftitem("farming:bread", {
	description = "Brot",
	inventory_image = "farming_bread.png",
	on_use = minetest.item_eat(4),
	stack_max = 64,
	groups = {food = 1}
})