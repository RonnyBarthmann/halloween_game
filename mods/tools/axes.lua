minetest.register_tool("tools:axe_wood", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Holzaxt",
	inventory_image = "tools_axe_wood.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy = {times={[2]=3.00, [3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {flammable = 2, wood_tool = 1},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:axe_stone", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Steinaxt",
	inventory_image = "tools_axe_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=3.00, [2]=2.00, [3]=1.30}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:axe_bronze", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Bronzeaxt",
	inventory_image = "tools_axe_bronze.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:axe_steel", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Stahlaxt",
	inventory_image = "tools_axe_steel.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:axe_silver", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Silberaxt",
	inventory_image = "tools_axe_silver.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=2,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:axe_gold", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Goldaxt",
	inventory_image = "tools_axe_gold.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=2,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:axe_mithril", {
	description = minetest.get_color_escape_sequence("#0070dd") .. "Mithrilaxt",
	inventory_image = "tools_axe_mithril.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=2,
		groupcaps={
			choppy={times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:axe_adamantit", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Adamantitaxt",
	inventory_image = "tools_axe_adamantit.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:axe_khorium", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Khoriumaxt",
	inventory_image = "tools_axe_khorium.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:axe_kobalt", {
	description = minetest.get_color_escape_sequence("#ff8000") .. "Kobaltaxt",
	inventory_image = "tools_axe_kobalt.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=2.00, [2]=0.80, [3]=0.40}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})