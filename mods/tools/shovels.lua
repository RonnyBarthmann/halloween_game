minetest.register_tool("tools:shovel_wood", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Holzschaufel",
	inventory_image = "tools_shovel_wood.png",
	wield_image = "tools_shovel_wood.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=1},
	},
	groups = {flammable = 2, wood_tool = 1},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:shovel_stone", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Steinschaufel",
	inventory_image = "tools_shovel_stone.png",
	wield_image = "tools_shovel_stone.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:shovel_bronze", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Bronzeschaufel",
	inventory_image = "tools_shovel_bronze.png",
	wield_image = "tools_shovel_bronze.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=2,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:shovel_steel", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Stahlschaufel",
	inventory_image = "tools_shovel_steel.png",
	wield_image = "tools_shovel_steel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=2,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:shovel_silver", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Silberschaufel",
	inventory_image = "tools_shovel_silver.png",
	wield_image = "tools_shovel_silver.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=2,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:shovel_gold", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Goldschaufel",
	inventory_image = "tools_shovel_gold.png",
	wield_image = "tools_shovel_gold.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=2,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:shovel_mithril", {
	description = minetest.get_color_escape_sequence("#0070dd") .. "Mithrilschaufel",
	inventory_image = "tools_shovel_mithril.png",
	wield_image = "tools_shovel_mithril.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=2,
		groupcaps={
			crumbly = {times={[1]=1.00, [2]=0.00, [3]=0.30}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:shovel_adamantit", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Adamantitschaufel",
	inventory_image = "tools_shovel_adamantit.png",
	wield_image = "tools_shovel_adamantit.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:shovel_khorium", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Khoriumschaufel",
	inventory_image = "tools_shovel_khorium.png",
	wield_image = "tools_shovel_khorium.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:shovel_kobalt", {
	description = minetest.get_color_escape_sequence("#ff8000") .. "Kobaltschaufel",
	inventory_image = "tools_shovel_kobalt.png",
	wield_image = "tools_shovel_kobalt.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.00, [2]=0.00, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})