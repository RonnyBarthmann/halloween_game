minetest.register_craftitem("farming:cotton_seeds", {
	description = "Baumwollsaat",
	inventory_image = "farming_cotton_seed.png",
	stack_max = 64,
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "farming:cotton_1")
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
		name = "Baumwolle"
	else
		create = false
	end

	minetest.register_node("farming:cotton_"..i, {
		description = "Baumwolle",
		waving = 1,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		drawtype = "plantlike",
		visual_scale = 1.14,
		drop = "farming:cotton_seeds",
		tiles = {"farming_cotton_stage_"..(i-1)..".png"},
		inventory_image = "farming_cotton_stage_"..(i-1)..".png",
		wield_image = "farming_cotton_stage_"..(i-1)..".png",
		drop = "farming:cotton_seeds",
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

minetest.register_node("farming:cotton", {
	description = "Baumwolle",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	visual_scale = 1.14,
	tiles = {"farming_cotton_stage_7.png"},
	inventory_image = "farming_cotton_stage_7.png",
	wield_image = "farming_cotton_stage_7.png",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
		},
	},
	drop = {
			items = {
			{ items = {'farming:cotton_item 2'}},
			{ items = {'farming:cotton_item 4'}, rarity = 3 },
			{ items = {'farming:cotton_seeds 1'}},
			{ items = {'farming:cotton_seeds 2'}, rarity = 3 }
		}
	},
	groups = {snappy=3, not_in_creative_inventory=1, plant=1, flora = 1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

farming:add_plant("plant_cotton", "farming:cotton", {"farming:cotton_1", "farming:cotton_2", "farming:cotton_3", "farming:cotton_4", "farming:cotton_5", "farming:cotton_6", "farming:cotton_7"}, 68, 3)

minetest.register_craftitem("farming:cotton_item", {
	description = "Baumwolle",
	inventory_image = "farming_cotton.png",
	stack_max = 64,
	groups = {flora = 1}
})