minetest.register_craftitem("farming:pumpkin_seeds", {
	description = "Kuerbissaat",
	stack_max = 64,
	inventory_image = "farming_pumpkin_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "farming:pumpkin_1")
	end,
	groups = {flora = 1}
})

minetest.register_node("farming:pumpkin_face", {
	description = "Kuerbis",
	tiles = {"farming_pumpkin_top.png", "farming_pumpkin_buttom.png", "farming_pumpkin_side.png", "farming_pumpkin_side.png", "farming_pumpkin_side.png", "farming_pumpkin_face.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	drop = "farming:pumpkin",
	is_ground_content = false,
	groups = {oddly_breakable_by_hand = 2, not_in_creative_inventory = 1, plant = 1, flora = 1, fence_connect = 1},
	sounds = default.node_sound_leaves_defaults(),
})

local pumpkin_base_def = {
	description = "Kuerbis",
	stack_max = 64,
	tiles = {"farming_pumpkin_top.png", "farming_pumpkin_buttom.png", "farming_pumpkin_side.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, plant=1, flora = 1, fence_connect = 1},
	paramtype = "light",
	drop = "farming:pumpkin_item 9",
	sounds = default.node_sound_wood_defaults(),
}

local stem_drop = {"farming:pumpkin_seeds"}

local startcolor = { r = 128 , g = 0, b = 0 }
local endcolor = { r = 0 , g = 128, b = 0 }

for s=1,7 do
	local h = s / 8
	local doc = s == 1
	local colorstring = farming:stem_color(startcolor, endcolor, s, 8)
	minetest.register_node("farming:pumpkin_"..s, {
		description = "Kuerbis",
		paramtype = "light",
		walkable = false,
		drawtype = "plantlike",
		sunlight_propagates = true,
		drop = stem_drop,
		tiles = {"([combine:16x16:0,"..((8-s)*2).."=farming_pumpkin_stem_disconnected.png)^[colorize:"..colorstring..":127"},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.15, -0.5, -0.15, 0.15, -0.5+h, 0.15}
			},
		},
		groups = {snappy=3, not_in_creative_inventory=1, plant=1, flora = 1, attached_node=1, plant_pumpkin_stem=s},
		sounds = default.node_sound_leaves_defaults(),
	})
end

local stem_def = {
	description = "Kuerbis",
	tiles = {"farming_pumpkin_stem_disconnected.png^[colorize:#808000:127"},
}

farming:add_plant("plant_pumpkin_stem", "farming:pumpkintige_unconnect", {"farming:pumpkin_1", "farming:pumpkin_2", "farming:pumpkin_3", "farming:pumpkin_4", "farming:pumpkin_5", "farming:pumpkin_6", "farming:pumpkin_7"}, 30, 5)

farming:add_gourd("farming:pumpkintige_unconnect", "farming:pumpkintige_linked", "farming:pumpkintige_unconnect", stem_def, stem_drop, "farming:pumpkin", pumpkin_base_def, 25, 15, "farming_pumpkin_stem_connected.png^[colorize:#808000:127")

minetest.register_craftitem("farming:pumpkin_item", {
	description = "Kuerbisscheibe",
	stack_max = 64,
	on_use = minetest.item_eat(2),
	inventory_image = "farming_pumpkin.png",
	groups = {food = 1}
})

minetest.register_node("farming:pumpkinlantern_off", {
	description = "Kuerbislanterne",
	tiles = {
		"farming_pumpkin_top.png",
		"farming_pumpkin_buttom.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_face.png"
	},
	paramtype2 = "facedir",
	stack_max = 64,
	groups = {choppy = 1, oddly_breakable_by_hand = 1, fence_connect = 1},
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, puncher)
		node.name = "farming:pumpkinlantern_on"
		minetest.swap_node(pos, node)
	end,
	on_construct = function(pos)
		for i = 1,2 do
			if minetest.get_node({x=pos.x,y=pos.y-i,z=pos.z}).name ~= "default:snowblock" then
				return
			end
		end
		
		for i = 0,2 do
			minetest.remove_node({x=pos.x,y=pos.y-i,z=pos.z})
		end
		minetest.add_entity({x=pos.x,y=pos.y-1,z=pos.z}, "mobs:snowman")
    end,
})

minetest.register_node("farming:pumpkinlantern_on", {
	tiles = {
		"farming_pumpkin_top.png",
		"farming_pumpkin_buttom.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_side.png",
		"farming_pumpkin_face_light.png"
	},
	light_source = default.LIGHT_MAX,
	paramtype2 = "facedir",
	stack_max = 64,
	groups = {choppy = 1, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1, fence_connect = 1},
	sounds = default.node_sound_wood_defaults(),
	drop = "farming:pumpkinlantern_off",
	on_rightclick = function(pos, node, puncher)
		node.name = "farming:pumpkinlantern_off"
		minetest.swap_node(pos, node)
	end,
})