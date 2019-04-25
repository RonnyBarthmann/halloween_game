minetest.register_tool("tools:pick_wood", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Holzhacke",
	inventory_image = "tools_pick_wood.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=3.0, [3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {flammable = 2, wood_tool = 1},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:pick_stone", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Steinhacke",
	inventory_image = "tools_pick_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=1,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:pick_bronze", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Bronzehacke",
	inventory_image = "tools_pick_bronze.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=2,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:pick_steel", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Stahlhacke",
	inventory_image = "tools_pick_steel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=2,
		groupcaps={
			cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:pick_silver", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Silberhacke",
	inventory_image = "tools_pick_silver.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=2,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:pick_gold", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Goldhacke",
	inventory_image = "tools_pick_gold.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=2,
		groupcaps={
			cracky = {times={[1]=2.0, [2]=1.0, [3]=0.50}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:pick_mithril", {
	description = minetest.get_color_escape_sequence("#0070dd") .. "Mithrilhacke",
	inventory_image = "tools_pick_mithril.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=2,
		groupcaps={
			cracky = {times={[1]=1.8, [2]=0.9, [3]=0.40}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:pick_adamantit", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Adamantithacke",
	inventory_image = "tools_pick_adamantit.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:pick_khorium", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Khoriumhacke",
	inventory_image = "tools_pick_khorium.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:pick_kobalt", {
	description = minetest.get_color_escape_sequence("#ff8000") .. "Kobalthacke",
	inventory_image = "tools_pick_kobalt.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.8, [2]=0.9, [3]=0.40}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})