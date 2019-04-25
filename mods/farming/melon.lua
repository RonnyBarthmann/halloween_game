minetest.register_craftitem("farming:melon_seeds", {
	description = "Melonenssaat",
	stack_max = 64,
	inventory_image = "farming_melon_seed.png",
	on_place = function(itemstack, placer, pointed_thing)
		return farming:place_seed(itemstack, placer, pointed_thing, "farming:melontige_1")
	end,
	groups = {flora = 1}
})

local melon_base_def = {
	description = "Melone",
	stack_max = 64,
	tiles = {"farming_melon_top.png", "farming_melon_top.png", "farming_melon_side.png"},
	groups = {choppy = 3, oddly_breakable_by_hand = 2, plant=1, flora = 1, attached_node = 1, fence_connect = 1},
	paramtype = "light",
	drop = "farming:melon_item 9",
	sounds = default.node_sound_wood_defaults(),
}

local stem_drop = {"farming:melon_seeds"}

local startcolor = { r = 128 , g = 0, b = 0 }
local endcolor = { r = 0 , g = 128, b = 0 }


for s=1,7 do
	local h = s / 8
	local doc = s == 1
	local colorstring = farming:stem_color(startcolor, endcolor, s, 8)
	minetest.register_node("farming:melontige_"..s, {
		description = "Melone",
		paramtype = "light",
		walkable = false,
		drawtype = "plantlike",
		sunlight_propagates = true,
		drop = stem_drop,
		tiles = {"([combine:16x16:0,"..((8-s)*2).."=farming_melon_stem_disconnected.png)^[colorize:"..colorstring..":127"},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.15, -0.5, -0.15, 0.15, -0.5+h, 0.15}
			},
		},
		groups = {snappy=3, not_in_creative_inventory=1, plant=1, attached_node=1, flora = 1, plant_melon_stem=s},
		sounds = default.node_sound_leaves_defaults(),
	})
end

local stem_def = {
	description = "Melone",
	tiles = {"farming_melon_stem_disconnected.png^[colorize:#808000:127"},
}

farming:add_plant("plant_melon_stem", "farming:melontige_unconnect", {"farming:melontige_1", "farming:melontige_2", "farming:melontige_3", "farming:melontige_4", "farming:melontige_5", "farming:melontige_6", "farming:melontige_7"}, 30, 5)

farming:add_gourd("farming:melontige_unconnect", "farming:melontige_linked", "farming:melontige_unconnect", stem_def, stem_drop, "farming:melon", melon_base_def, 25, 15, "farming_melon_stem_connected.png^[colorize:#808000:127")

minetest.register_craftitem("farming:melon_item", {
	description = "Melonenscheibe",
	stack_max = 64,
	on_use = minetest.item_eat(2),
	inventory_image = "farming_melon.png",
	groups = {food = 1}
})