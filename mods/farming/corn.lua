minetest.register_craftitem("farming:corn_seeds", {
	description = "Maiscorn",
	inventory_image = "farming_corn_seed.png",
	stack_max = 64,
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "farming:corn_1")
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
		name = "Mais"
	else
		create = false
	end

	minetest.register_node("farming:corn_"..i, {
		description = "Mais",
		waving = 1,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		drawtype = "nodebox",
		visual_scale = 1.14,
		drop = "farming:corn_seeds",
		tiles = {"farming_corn_stage_"..(i-1)..".png"},
		inventory_image = "farming_corn_stage_"..(i-1)..".png",
		wield_image = "farming_corn_stage_"..(i-1)..".png",
		drop = "farming:corn_seeds",
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

minetest.register_node("farming:corn", {
	description = "Mais",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	drawtype = "nodebox",
	visual_scale = 1.14,
	tiles = {"farming_corn_stage_7.png"},
	inventory_image = "farming_corn_stage_7.png",
	wield_image = "farming_corn_stage_7.png",
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
			{ items = {'farming:corn_item 2'}},
			{ items = {'farming:corn_item 4'}, rarity = 3 },
			{ items = {'farming:corn_seeds 1'}},
			{ items = {'farming:corn_seeds 2'}, rarity = 3 }
		}
	},
	groups = {snappy=3, not_in_creative_inventory=1, plant=1, flora = 1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

farming:add_plant("plant_corn", "farming:corn", {"farming:corn_1", "farming:corn_2", "farming:corn_3", "farming:corn_4", "farming:corn_5", "farming:corn_6", "farming:corn_7"}, 68, 3)

minetest.register_craftitem("farming:corn_item", {
	description = "Maiskolben",
	inventory_image = "farming_corn.png",
	stack_max = 64,
	on_use = minetest.item_eat(4),
	groups = {flora = 1}
})

minetest.register_craftitem("farming:popcorn", {
	description = "Popcorn",
	inventory_image = "farming_popcorn.png",
	stack_max = 64,
	on_use = minetest.item_eat(2),
	groups = {flora = 1}
})