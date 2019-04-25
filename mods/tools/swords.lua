minetest.register_tool("tools:sword_wood", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Holzschwert",
	inventory_image = "tools_sword_wood.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			fleshy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {flammable = 2, wood_tool = 1},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:sword_stone", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Steinschwert",
	inventory_image = "tools_sword_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:sword_bronze", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Bronzeschwert",
	inventory_image = "tools_sword_bronze.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=2,
		groupcaps={
			fleshy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:sword_steel", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Stahlschwert",
	inventory_image = "tools_sword_steel.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=2,
		groupcaps={
			fleshy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:sword_silver", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Silberschwert",
	inventory_image = "tools_sword_silver.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=2,
		groupcaps={
			fleshy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:sword_gold", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Goldschwert",
	inventory_image = "tools_sword_gold.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=2,
		groupcaps={
			fleshy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:sword_mithril", {
	description = minetest.get_color_escape_sequence("#0070dd") .. "Mithrilschwert",
	inventory_image = "tools_sword_mithril.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=2,
		groupcaps={
			fleshy={times={[1]=1.80, [2]=0.80, [3]=0.30}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:sword_adamantit", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Adamantitschwert",
	inventory_image = "tools_sword_adamantit.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=2.00, [2]=1.00, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:sword_khorium", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Khoriumschwert",
	inventory_image = "tools_sword_khorium.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=2.00, [2]=1.00, [3]=0.35}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:sword_kobalt", {
	description = minetest.get_color_escape_sequence("#ff8000") .. "Kobaltschwert",
	inventory_image = "tools_sword_kobalt.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=3,
		groupcaps={
			fleshy={times={[1]=1.80, [2]=0.80, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
})