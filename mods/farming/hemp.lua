local rope = {}

minetest.register_craftitem("farming:hemp_seeds", {
	description = "Hanfsaat",
	inventory_image = "farming_hemp_seed.png",
	stack_max = 64,
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "farming:hemp_1")
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
		name = "Hanf"
	else
		create = false
	end

	minetest.register_node("farming:hemp_"..i, {
		description = "Hanf",
		waving = 1,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		drawtype = "plantlike",
		visual_scale = 1.14,
		drop = "farming:hemp_seeds",
		tiles = {"farming_hemp_stage_"..(i-1)..".png"},
		inventory_image = "farming_hemp_stage_"..(i-1)..".png",
		wield_image = "farming_hemp_stage_"..(i-1)..".png",
		drop = "farming:hemp_seeds",
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

minetest.register_node("farming:hemp", {
	description = "Hanf",
	waving = 1,
	sunlight_propagates = true,
	paramtype = "light",
	walkable = false,
	drawtype = "plantlike",
	visual_scale = 1.14,
	tiles = {"farming_hemp_stage_7.png"},
	inventory_image = "farming_hemp_stage_7.png",
	wield_image = "farming_hemp_stage_7.png",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
		},
	},
	drop = {
		items = {
			{ items = {'farming:hemp_item 2'}},
			{ items = {'farming:hemp_item 4'}, rarity = 3 },
			{ items = {'farming:hemp_seeds 1'}},
			{ items = {'farming:hemp_seeds 2'}, rarity = 3 }
		}
	},
	groups = {snappy=3, not_in_creative_inventory=1, plant=1, flora = 1, attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
})

farming:add_plant("plant_hemp", "farming:hemp", {"farming:hemp_1", "farming:hemp_2", "farming:hemp_3", "farming:hemp_4", "farming:hemp_5", "farming:hemp_6", "farming:hemp_7"}, 68, 3)

minetest.register_craftitem("farming:hemp_item", {
	description = "Hanfblatt",
	inventory_image = "farming_hemp_harvested.png",
	stack_max = 64,
	groups = {flora = 1}
})

function rope.place(itemstack, placer, pointed_thing)
	if pointed_thing.type == "node" then
		local pos = pointed_thing.above
		local oldnode = minetest.get_node(pos)
		local stackname = itemstack:get_name()
		if minetest.is_protected(pos, placer:get_player_name()) then
			return itemstack
		end

		while oldnode.name == "air" and not itemstack:is_empty() do
			local newnode = {name = stackname, param1 = 0}
			minetest.set_node(pos, newnode)
			itemstack:take_item()
			pos.y = pos.y - 1
			oldnode = minetest.get_node(pos)
		end
	end
	return itemstack
end

function rope.remove(pos, oldnode, digger, rope_name)
	local num = 0
	local below = {x=pos.x, y=pos.y, z=pos.z}
	local digger_inv = digger:get_inventory()

	while minetest.get_node(below).name == rope_name do
		minetest.remove_node(below)
		below.y = below.y - 1
		num = num + 1
	end
	if num == 0 then return end
	digger_inv:add_item("main", rope_name.." "..num)
	return true
end

minetest.register_node("farming:hemp_rope", {
	description = "Hanffaserstrick",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
	tiles = {"farming_hemp_rope.png"},
	wield_image = "farming_hemp_rope.png",
	inventory_image = "farming_hemp_rope.png",
	drawtype = "plantlike",
	stack_max = 64,
	groups = {flammable = 2, snappy = 3, oddly_breakable_by_hand = 3},
	sounds =  default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	on_place = rope.place,
	on_punch = function(pos, node, puncher, pointed_thing)
		local player_name = puncher:get_player_name()
		if not minetest.is_protected(pos, player_name) or
			minetest.get_player_privs(player_name).protection_bypass then
			rope.remove(pos, node, puncher, "farming:hemp_rope")
		end
	end
})