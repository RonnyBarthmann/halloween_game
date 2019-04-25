local function hoe_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	
	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)

	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end

	if above.name ~= "air" then
		return
	end

	if minetest.get_item_group(under.name, "soil") ~= 1 then
		return
	end

	minetest.set_node(pt.under, {name="farming:soil"})
	minetest.sound_play("default_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	})

	itemstack:add_wear(65535/(uses-1))
	return itemstack
end

minetest.register_tool("tools:hoe_wood", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Holzharke",
	inventory_image = "tools_hoe_wood.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "30")
	end,
	groups = {flammable = 2, wood_tool = 1}
})

minetest.register_tool("tools:hoe_stone", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Steinharke",
	inventory_image = "tools_hoe_stone.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "90")
	end,
})

minetest.register_tool("tools:hoe_bronze", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Bronzeharke",
	inventory_image = "tools_hoe_bronze.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "200")
	end,
})

minetest.register_tool("tools:hoe_steel", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Stahlharke",
	inventory_image = "tools_hoe_steel.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "220")
	end,
})

minetest.register_tool("tools:hoe_silver", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Silberharke",
	inventory_image = "tools_hoe_silver.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "350")
	end,
})

minetest.register_tool("tools:hoe_gold", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Goldharke",
	inventory_image = "tools_hoe_gold.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "500")
	end,
})

minetest.register_tool("tools:hoe_mithril", {
	description = minetest.get_color_escape_sequence("#0070dd") .. "Mithrilharke",
	inventory_image = "tools_hoe_mithril.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "550")
	end,
})

minetest.register_tool("tools:hoe_adamantit", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Adamantitharke",
	inventory_image = "tools_hoe_adamantit.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "600")
	end,
})

minetest.register_tool("tools:hoe_khorium", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Khoriumharke",
	inventory_image = "tools_hoe_khorium.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "750")
	end,
})

minetest.register_tool("tools:hoe_kobalt", {
	description = minetest.get_color_escape_sequence("#ff8000") .. "Kobaltharke",
	inventory_image = "tools_hoe_kobalt.png^[transformR90",
	wield_scale = {x=1,y=1,z=1},
	on_use = function(itemstack, user, pointed_thing, uses)
		return hoe_on_use(itemstack, user, pointed_thing, "1000")
	end,
})