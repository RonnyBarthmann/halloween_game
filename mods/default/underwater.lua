minetest.register_node("default:seastone_cyan", {
	description = "Cyan Steinkorallen",
	tiles = {"default_seastone_cyan.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:seabrick_cyan", {
	description = "Cyan Korallenziegel",
	tiles = {"default_seabrick_cyan.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:dark_seabrick_cyan", {
	description = "Dunkelcyan Korallenziegel",
	tiles = {"default_dark_seabrick_cyan.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_cyan", {
	description = "Cyan Koralle",
	drawtype = "plantlike_rooted",
	waving = 1,
	paramtype = "light",
	tiles = {"default_seastone_cyan.png"},
	special_tiles = {{name = "default_coral_cyan.png", tileable_vertical = true}},
	inventory_image = "default_coral_cyan.png",
	light_source = default.LIGHT_MAX -11,
	stack_max = 64,
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:seastone_cyan",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" or not placer then
			return itemstack
		end

		local player_name = placer:get_player_name()
		local pos_under = pointed_thing.under
		local pos_above = pointed_thing.above

		if minetest.get_node(pos_under).name ~= "default:seastone_cyan" or
				minetest.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if minetest.is_protected(pos_under, player_name) or
				minetest.is_protected(pos_above, player_name) then
			minetest.record_protection_violation(pos_under, player_name)
			return itemstack
		end

		minetest.set_node(pos_under, {name = "default:coral_cyan"})
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:seastone_cyan"})
	end,
})

minetest.register_node("default:seastone_jade", {
	description = "Jade Steinkorallen",
	tiles = {"default_seastone_jade.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:seabrick_jade", {
	description = "Jade Korallenziegel",
	tiles = {"default_seabrick_jade.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:dark_seabrick_jade", {
	description = "Dunkeljade Korallenziegel",
	tiles = {"default_dark_seabrick_jade.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_jade", {
	description = "Jade Koralle",
	drawtype = "plantlike_rooted",
	waving = 1,
	light_source = default.LIGHT_MAX -11,
	stack_max = 64,
	paramtype = "light",
	tiles = {"default_seastone_jade.png"},
	special_tiles = {{name = "default_coral_jade.png", tileable_vertical = true}},
	inventory_image = "default_coral_jade.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:seastone_jade",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" or not placer then
			return itemstack
		end

		local player_name = placer:get_player_name()
		local pos_under = pointed_thing.under
		local pos_above = pointed_thing.above

		if minetest.get_node(pos_under).name ~= "default:seastone_jade" or
				minetest.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if minetest.is_protected(pos_under, player_name) or
				minetest.is_protected(pos_above, player_name) then
			minetest.record_protection_violation(pos_under, player_name)
			return itemstack
		end

		minetest.set_node(pos_under, {name = "default:coral_jade"})
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:seastone_jade"})
	end,
})

minetest.register_node("default:seastone_green", {
	description = "Gruene Steinkorallen",
	tiles = {"default_seastone_green.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:seabrick_green", {
	description = "Gruene Korallenziegel",
	tiles = {"default_seabrick_green.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:dark_seabrick_green", {
	description = "Dunkelgruene Korallenziegel",
	tiles = {"default_dark_seabrick_green.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_green", {
	description = "Gruene Koralle",
	drawtype = "plantlike_rooted",
	waving = 1,
	light_source = default.LIGHT_MAX -11,
	stack_max = 64,
	paramtype = "light",
	tiles = {"default_seastone_green.png"},
	special_tiles = {{name = "default_coral_green.png", tileable_vertical = true}},
	inventory_image = "default_coral_green.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:seastone_green",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" or not placer then
			return itemstack
		end

		local player_name = placer:get_player_name()
		local pos_under = pointed_thing.under
		local pos_above = pointed_thing.above

		if minetest.get_node(pos_under).name ~= "default:seastone_green" or
				minetest.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if minetest.is_protected(pos_under, player_name) or
				minetest.is_protected(pos_above, player_name) then
			minetest.record_protection_violation(pos_under, player_name)
			return itemstack
		end

		minetest.set_node(pos_under, {name = "default:coral_green"})
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:seastone_green"})
	end,
})

minetest.register_node("default:seastone_blue", {
	description = "Blaue Steinkorallen",
	tiles = {"default_seastone_blue.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:seabrick_blue", {
	description = "Blaue Korallenziegel",
	tiles = {"default_seabrick_blue.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:dark_seabrick_blue", {
	description = "Dunkelblaue Korallenziegel",
	tiles = {"default_dark_seabrick_blue.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_blue", {
	description = "Blaue Koralle",
	drawtype = "plantlike_rooted",
	waving = 1,
	light_source = default.LIGHT_MAX -11,
	stack_max = 64,
	paramtype = "light",
	tiles = {"default_seastone_blue.png"},
	special_tiles = {{name = "default_coral_blue.png", tileable_vertical = true}},
	inventory_image = "default_coral_blue.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:seastone_blue",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" or not placer then
			return itemstack
		end

		local player_name = placer:get_player_name()
		local pos_under = pointed_thing.under
		local pos_above = pointed_thing.above

		if minetest.get_node(pos_under).name ~= "default:seastone_blue" or
				minetest.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if minetest.is_protected(pos_under, player_name) or
				minetest.is_protected(pos_above, player_name) then
			minetest.record_protection_violation(pos_under, player_name)
			return itemstack
		end

		minetest.set_node(pos_under, {name = "default:coral_blue"})
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:seastone_blue"})
	end,
})

minetest.register_node("default:seastone_orange", {
	description = "Orange Steinkorallen",
	tiles = {"default_seastone_orange.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:seabrick_orange", {
	description = "Oranger Korallenziegel",
	tiles = {"default_seabrick_orange.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:dark_seabrick_orange", {
	description = "Dunkeloranger Korallenziegel",
	tiles = {"default_dark_seabrick_orange.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_orange", {
	description = "Orange Koralle",
	drawtype = "plantlike_rooted",
	waving = 1,
	light_source = default.LIGHT_MAX -11,
	stack_max = 64,
	paramtype = "light",
	tiles = {"default_seastone_orange.png"},
	special_tiles = {{name = "default_coral_orange.png", tileable_vertical = true}},
	inventory_image = "default_coral_orange.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:seastone_orange",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" or not placer then
			return itemstack
		end

		local player_name = placer:get_player_name()
		local pos_under = pointed_thing.under
		local pos_above = pointed_thing.above

		if minetest.get_node(pos_under).name ~= "default:seastone_orange" or
				minetest.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if minetest.is_protected(pos_under, player_name) or
				minetest.is_protected(pos_above, player_name) then
			minetest.record_protection_violation(pos_under, player_name)
			return itemstack
		end

		minetest.set_node(pos_under, {name = "default:coral_orange"})
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:seastone_orange"})
	end,
})

minetest.register_node("default:seastone_purble", {
	description = "Lilane Steinkorallen",
	tiles = {"default_seastone_purble.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:seabrick_purble", {
	description = "Lilaner Korallenziegel",
	tiles = {"default_seabrick_purble.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:dark_seabrick_purble", {
	description = "Dunkellilaner Korallenziegel",
	tiles = {"default_dark_seabrick_purble.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_purble", {
	description = "Lilane Koralle",
	drawtype = "plantlike_rooted",
	waving = 1,
	light_source = default.LIGHT_MAX -11,
	stack_max = 64,
	paramtype = "light",
	tiles = {"default_seastone_purble.png"},
	special_tiles = {{name = "default_coral_purble.png", tileable_vertical = true}},
	inventory_image = "default_coral_purble.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:seastone_purble",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" or not placer then
			return itemstack
		end

		local player_name = placer:get_player_name()
		local pos_under = pointed_thing.under
		local pos_above = pointed_thing.above

		if minetest.get_node(pos_under).name ~= "default:seastone_purble" or
				minetest.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if minetest.is_protected(pos_under, player_name) or
				minetest.is_protected(pos_above, player_name) then
			minetest.record_protection_violation(pos_under, player_name)
			return itemstack
		end

		minetest.set_node(pos_under, {name = "default:coral_purble"})
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:seastone_purble"})
	end,
})

minetest.register_node("default:seastone_pink", {
	description = "Pinke Steinkorallen",
	tiles = {"default_seastone_pink.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:seabrick_pink", {
	description = "Pinker Korallenziegel",
	tiles = {"default_seabrick_pink.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:dark_seabrick_pink", {
	description = "Dunkelpinker Korallenziegel",
	tiles = {"default_dark_seabrick_pink.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_pink", {
	description = "Pinke Koralle",
	drawtype = "plantlike_rooted",
	waving = 1,
	light_source = default.LIGHT_MAX -11,
	stack_max = 64,
	paramtype = "light",
	tiles = {"default_seastone_pink.png"},
	special_tiles = {{name = "default_coral_pink.png", tileable_vertical = true}},
	inventory_image = "default_coral_pink.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:seastone_pink",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" or not placer then
			return itemstack
		end

		local player_name = placer:get_player_name()
		local pos_under = pointed_thing.under
		local pos_above = pointed_thing.above

		if minetest.get_node(pos_under).name ~= "default:seastone_pink" or
				minetest.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if minetest.is_protected(pos_under, player_name) or
				minetest.is_protected(pos_above, player_name) then
			minetest.record_protection_violation(pos_under, player_name)
			return itemstack
		end

		minetest.set_node(pos_under, {name = "default:coral_pink"})
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:seastone_pink"})
	end,
})

minetest.register_node("default:seastone_red", {
	description = "Rote Steinkorallen",
	tiles = {"default_seastone_red.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:seabrick_red", {
	description = "Roter Korallenziegel",
	tiles = {"default_seabrick_red.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:dark_seabrick_red", {
	description = "Dunkelroter Korallenziegel",
	tiles = {"default_dark_seabrick_red.png"},
	paramtype = "light",
	stack_max = 64,
	is_ground_content = false,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_red", {
	description = "Rote Koralle",
	drawtype = "plantlike_rooted",
	waving = 1,
	light_source = default.LIGHT_MAX -11,
	stack_max = 64,
	paramtype = "light",
	tiles = {"default_seastone_red.png"},
	special_tiles = {{name = "default_coral_red.png", tileable_vertical = true}},
	inventory_image = "default_coral_red.png",
	groups = {snappy = 3},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
				{-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
		},
	},
	node_dig_prediction = "default:seastone_red",
	node_placement_prediction = "",
	sounds = default.node_sound_stone_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" or not placer then
			return itemstack
		end

		local player_name = placer:get_player_name()
		local pos_under = pointed_thing.under
		local pos_above = pointed_thing.above

		if minetest.get_node(pos_under).name ~= "default:seastone_red" or
				minetest.get_node(pos_above).name ~= "default:water_source" then
			return itemstack
		end

		if minetest.is_protected(pos_under, player_name) or
				minetest.is_protected(pos_above, player_name) then
			minetest.record_protection_violation(pos_under, player_name)
			return itemstack
		end

		minetest.set_node(pos_under, {name = "default:coral_red"})
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:seastone_red"})
	end,
})

minetest.register_node("default:sand_with_green_kelp", {
	description = "Gruene Algen",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "default_green_kelp.png", tileable_vertical = true}},
	inventory_image = "default_green_kelp.png",
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3},
	stack_max = 64,
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.625, 0.5},
		},
	},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = minetest.get_node(pointed_thing.under)
			local def_ptu = minetest.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
					itemstack, pointed_thing)
			end
		end

		local pos = pointed_thing.under
		if minetest.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		local height = math.random(1, 9)
		local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
		local node_top = minetest.get_node(pos_top)
		local def_top = minetest.registered_nodes[node_top.name]
		local player_name = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				minetest.get_item_group(node_top.name, "water") > 0 then
			if not minetest.is_protected(pos, player_name) and
					not minetest.is_protected(pos_top, player_name) then
				minetest.set_node(pos, {name = "default:sand_with_green_kelp",
					param2 = height * 16})
				if not (creative and creative.is_enabled_for
						and creative.is_enabled_for(player_name)) then
					itemstack:take_item()
				end
			else
				minetest.record_protection_violation(pos, player_name)
			end
		end

		return itemstack
	end,

	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:sand"})
	end
})

minetest.register_node("default:sand_with_red_kelp", {
	description = "Rote Algen",
	drawtype = "plantlike_rooted",
	waving = 1,
	tiles = {"default_sand.png"},
	special_tiles = {{name = "default_red_kelp.png", tileable_vertical = true}},
	inventory_image = "default_red_kelp.png",
	paramtype = "light",
	paramtype2 = "leveled",
	groups = {snappy = 3},
	stack_max = 64,
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0.625, 0.5},
		},
	},
	node_dig_prediction = "default:sand",
	node_placement_prediction = "",
	sounds = default.node_sound_sand_defaults({
		dig = {name = "default_dig_snappy", gain = 0.2},
		dug = {name = "default_grass_footstep", gain = 0.25},
	}),

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" and placer and
				not placer:get_player_control().sneak then
			local node_ptu = minetest.get_node(pointed_thing.under)
			local def_ptu = minetest.registered_nodes[node_ptu.name]
			if def_ptu and def_ptu.on_rightclick then
				return def_ptu.on_rightclick(pointed_thing.under, node_ptu, placer,
					itemstack, pointed_thing)
			end
		end

		local pos = pointed_thing.under
		if minetest.get_node(pos).name ~= "default:sand" then
			return itemstack
		end

		local height = math.random(1, 9)
		local pos_top = {x = pos.x, y = pos.y + height, z = pos.z}
		local node_top = minetest.get_node(pos_top)
		local def_top = minetest.registered_nodes[node_top.name]
		local player_name = placer:get_player_name()

		if def_top and def_top.liquidtype == "source" and
				minetest.get_item_group(node_top.name, "water") > 0 then
			if not minetest.is_protected(pos, player_name) and
					not minetest.is_protected(pos_top, player_name) then
				minetest.set_node(pos, {name = "default:sand_with_red_kelp",
					param2 = height * 16})
				if not (creative and creative.is_enabled_for
						and creative.is_enabled_for(player_name)) then
					itemstack:take_item()
				end
			else
				minetest.record_protection_violation(pos, player_name)
			end
		end

		return itemstack
	end,
	after_destruct  = function(pos, oldnode)
		minetest.set_node(pos, {name = "default:sand"})
	end
})

minetest.register_node("default:red_kelp_block", {
	description = "Roter Algenblock",
	tiles = {"default_red_kelp_block.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	stack_max = 64,
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("default:green_kelp_block", {
	description = "Gruener Algenblock",
	tiles = {"default_green_kelp_block.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	stack_max = 64,
	sounds = default.node_sound_sand_defaults(),
})