minetest.register_node("farming:soil", {
	tiles = {"farming_soil.png", "default_dirt_top.png", "farming_soil_side.png"},
	description = "Trockener Ackerboden",
	drop = "default:dirt",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5},
		}
	},
	stack_max = 64,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("wet", 0)
	end,
	groups = {crumbly = 2, soil = 2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("farming:soil_wet", {
	tiles = {"farming_soil_wet.png", "farming_dirt_wet.png", "farming_soil_wet_side.png"},
	description = "Feuchter Ackerboden",
	drop = "default:dirt",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5},
		}
	},
	stack_max = 64,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("wet", 7)
	end,
	groups = {crumbly = 2, not_in_creative_inventory = 1, soil = 3},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_abm({
	label = "Farmland hydration",
	nodenames = {"farming:soil", "farming:soil_wet"},
	interval = 15,
	chance = 4,
	catch_up = false,

	action = function(pos, node)

		pos.y = pos.y + 1
		local nn = minetest.get_node_or_nil(pos)
		pos.y = pos.y - 1

		if nn then nn = nn.name else return end

		if minetest.registered_nodes[nn]
		and minetest.registered_nodes[nn].walkable
		and minetest.get_item_group(nn, "plant") == 0 then
			minetest.set_node(pos, {name = "default:dirt"})
			return
		end

		if minetest.find_node_near(pos, 3, {"ignore"}) then
			return
		end

		if minetest.find_node_near(pos, 3, {"group:water"}) then
			if node.name == "farming:soil" then
				minetest.set_node(pos, {name = "farming:soil_wet"})
			end

		elseif node.name == "farming:soil_wet" then
			minetest.set_node(pos, {name = "farming:soil"})

		elseif node.name == "farming:soil" then
			minetest.set_node(pos, {name = "default:dirt"})
		end
	end,
})

