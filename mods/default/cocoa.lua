function default.cocoas_place(itemstack, placer, pointed_thing, plantname)

	local pt = pointed_thing

	if not pt or pt.type ~= "node" then
		return
	end

	local under = minetest.get_node(pt.under)

	if not minetest.registered_nodes[under.name] then
		return
	end

	if placer and not placer:get_player_control().sneak then
		if minetest.registered_nodes[under.name] and minetest.registered_nodes[under.name].on_rightclick then
			return minetest.registered_nodes[under.name].on_rightclick(pointed_thing.under, under, placer, itemstack) or itemstack
		end
	end

	if under.name ~= "default:jungletree"
	or minetest.get_node(pt.above).name ~= "air" then
		return
	end

	local clickdir = vector.subtract(pt.under, pt.above)

	if clickdir.y ~= 0 then
		return
	end

	minetest.set_node(pt.above, {name = plantname, param2 = minetest.dir_to_facedir(clickdir)})

	minetest.sound_play("default_place_node", {pos = pt.above, gain = 1.0})

	if not minetest.settings:get_bool("creative_mode") then
		itemstack:take_item()
	end

	return itemstack
end

function default.cocoas_grow(pos)
	local node = minetest.get_node(pos)
	if node.name == "default:cocoa_1" then
		minetest.set_node(pos, {name = "default:cocoa_2", param2 = node.param2})
	elseif node.name == "default:cocoa_2" then
		minetest.set_node(pos, {name = "default:cocoa_3", param2 = node.param2})
		return true
	end
	return false
end

minetest.register_craftitem("default:cocoa_beans", {
	description = "Kakaobohnen",
	inventory_image = "default_cocoa_beans.png",
	wield_image = "default_cocoa_beans.png",
	stack_max = 64,
	on_place = function(itemstack, placer, pointed_thing)
		return default.cocoas_place(itemstack, placer, pointed_thing, "default:cocoa_1")
	end,
	groups = {food = 1}
})

local crop_def = {
	description = "Kleine Kakaobohne",
	drawtype = "nodebox",
	tiles = {
		"[combine:16x16:6,1=default_cocoa_stage_0.png", "[combine:16x16:6,11=default_cocoa_stage_0.png",
		"default_cocoa_stage_0.png", "default_cocoa_stage_0.png^[transformFX",
		"[combine:16x16:-5,0=default_cocoa_stage_0.png", "[combine:16x16:-5,0=default_cocoa_stage_0.png",
	},
	inventory_image = "default_cocoa_beans.png",
	wield_image = "default_cocoa_beans.png",
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "facedir",
	walkable = true,
	drop = "default:cocoa_beans",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.0625, 0.1875, 0.125, 0.25, 0.4375},  -- Pod
			{0, 0.25, 0.25, 0, 0.5, 0.5},	-- Stem
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.0625, 0.1875, 0.125, 0.25, 0.4375},  -- Pod
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.0625, 0.1875, 0.125, 0.5, 0.5},  -- Pod
		},
	},
	groups = {oddly_breakable_by_hand = 2, cocoa = 1, attached_node_facedir = 1, flammable = 2, leafdecay = 3, leafdecay_drop = 1, not_in_creative_inventory = 1},
	sounds = default.node_sound_wood_defaults(),
}

minetest.register_node("default:cocoa_1", table.copy(crop_def))

crop_def.description = "Mittlere Kakaobohne"
crop_def.groups.cocoa = 2
crop_def.tiles = {
	"[combine:16x16:5,1=default_cocoa_stage_1.png", "[combine:16x16:5,9=default_cocoa_stage_1.png",
	"default_cocoa_stage_1.png", "default_cocoa_stage_1.png^[transformFX",
	"[combine:16x16:-4,0=default_cocoa_stage_1.png", "[combine:16x16:-4,0=default_cocoa_stage_1.png",
}
crop_def.node_box = {
	type = "fixed",
	fixed = {
		{-0.1875, -0.1875, 0.0625, 0.1875, 0.25, 0.4375},  -- Pod
		{0, 0.25, 0.25, 0, 0.5, 0.5},	-- Stem
	},
}
crop_def.collision_box = {
	type = "fixed",
	fixed = {
		{-0.1875, -0.1875, 0.0625, 0.1875, 0.25, 0.4375},  -- Pod
	},
}
crop_def.selection_box = {
	type = "fixed",
	fixed = {
		{-0.1875, -0.1875, 0.0625, 0.1875, 0.5, 0.5},
	},
}
crop_def.drop = "default:cocoa_beans 2"
minetest.register_node("default:cocoa_2", table.copy(crop_def))

crop_def.description = "Grosse Kakaobohne"
crop_def.groups.cocoa = 3
crop_def.tiles = {
	"default_cocoa_top_stage_2.png", "default_cocoa_top_stage_2.png^[transformFY",
	"default_cocoa_stage_2.png", "default_cocoa_stage_2.png^[transformFX",
	"[combine:16x16:-3,0=default_cocoa_stage_2.png", "[combine:16x16:-3,0=default_cocoa_stage_2.png",
}
crop_def.node_box = {
	type = "fixed",
	fixed = {
		{-0.25, -0.3125, -0.0625, 0.25, 0.25, 0.4375},  -- Pod
		{0, 0.25, 0.25, 0, 0.5, 0.5},	-- Stem
	},
}
crop_def.collision_box = {
	type = "fixed",
	fixed = {
		{-0.25, -0.3125, -0.0625, 0.25, 0.25, 0.4375},  -- Pod
	},
}
crop_def.selection_box = {
	type = "fixed",
	fixed = {
		{-0.25, -0.3125, -0.0625, 0.25, 0.5, 0.5},
	},
}
crop_def.drop = "default:cocoa_beans 3"
minetest.register_node("default:cocoa_3", table.copy(crop_def))


minetest.register_abm({
	label = "Cocoa growth",
	nodenames = {"default:cocoa_1", "default:cocoa_2"},
	interval = 50,
	chance = 20,
	action = function(pos, node)
		default.cocoas_grow(pos)
	end
})