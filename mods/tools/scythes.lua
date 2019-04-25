minetest.register_tool("tools:scythe_wood", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Holzsense",
	inventory_image = "tools_scythe_wood.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=1},
	},
	groups = {flammable = 2, wood_tool = 1},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:scythe_stone", {
	description = minetest.get_color_escape_sequence("#9d9d9d") .. "Steinsense",
	inventory_image = "tools_scythe_stone.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=1,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:scythe_bronze", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Bronzesense",
	inventory_image = "tools_scythe_bronze.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=2,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:scythe_steel", {
	description = minetest.get_color_escape_sequence("#ffffff") .. "Stahlsense",
	inventory_image = "tools_scythe_steel.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=2,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:scythe_silver", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Silbersense",
	inventory_image = "tools_scythe_silver.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=2,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:scythe_gold", {
	description = minetest.get_color_escape_sequence("#1eff00") .. "Goldsense",
	inventory_image = "tools_scythe_gold.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=2,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:scythe_mithril", {
	description = minetest.get_color_escape_sequence("#0070dd") .. "Mithrilsense",
	inventory_image = "tools_scythe_mithril.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=2,
		groupcaps={
			snappy={times={[1]=1.80, [2]=0.80, [3]=0.30}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:scythe_adamantit", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Adamantitsense",
	inventory_image = "tools_scythe_adamantit.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=3,
		groupcaps={
			snappy={times={[1]=2.00, [2]=1.00, [3]=0.35}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:scythe_khorium", {
	description = minetest.get_color_escape_sequence("#a335ee") .. "Khoriumsense",
	inventory_image = "tools_scythe_khorium.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=3,
		groupcaps={
			snappy={times={[1]=2.00, [2]=1.00, [3]=0.35}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("tools:scythe_kobalt", {
	description = minetest.get_color_escape_sequence("#ff8000") .. "Kobaltsense",
	inventory_image = "tools_scythe_kobalt.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=3,
		groupcaps={
			snappy={times={[1]=1.80, [2]=0.80, [3]=0.30}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})