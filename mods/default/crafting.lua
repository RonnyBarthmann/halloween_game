--
-- Craft
--

minetest.register_craft({
	output = "default:stone",
	recipe = {
		{"default:silver_sand", "default:silver_sand"},
		{"default:silver_sand", "default:silver_sand"}
	}
})

minetest.register_craft({
	output = 'default:runestone 4',
	recipe = {
		{'default:stone', 'default:stone', 'default:stone'},
		{'default:stone', '', 'default:stone'},
		{'default:stone', 'default:stone', 'default:stone'},
	}
})

minetest.register_craft({
	output = "default:diorite_smooth 4",
	recipe = {
		{"default:diorite", "default:diorite"},
		{"default:diorite", "default:diorite"}
	}
})

minetest.register_craft({
	output = "default:sandstone",
	recipe = {
		{"default:sand", "default:sand"},
		{"default:sand", "default:sand"}
	}
})

minetest.register_craft({
	output = "default:andesite_smooth 4",
	recipe = {
		{"default:andesite", "default:andesite"},
		{"default:diorite", "default:diorite"}
	}
})

minetest.register_craft({
	output = "default:desert_stone",
	recipe = {
		{"default:desert_sand", "default:desert_sand"},
		{"default:desert_sand", "default:desert_sand"}
	}
})

minetest.register_craft({
	output = "default:granite_smooth 4",
	recipe = {
		{"default:granite", "default:granite"},
		{"default:granite", "default:granite"}
	}
})

minetest.register_craft({
	output = 'default:coalblock',
	recipe = {
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
	}
})

minetest.register_craft({
	output = 'default:bronze_block',
	recipe = {
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
		{'default:bronze_ingot', 'default:bronze_ingot', 'default:bronze_ingot'},
	}
})

minetest.register_craft({
	output = 'default:steel_block',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'default:silver_block',
	recipe = {
		{'default:silver_ingot', 'default:silver_ingot', 'default:silver_ingot'},
		{'default:silver_ingot', 'default:silver_ingot', 'default:silver_ingot'},
		{'default:silver_ingot', 'default:silver_ingot', 'default:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'default:gold_block',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'default:mithril_block',
	recipe = {
		{'default:mithril_ingot', 'default:mithril_ingot', 'default:mithril_ingot'},
		{'default:mithril_ingot', 'default:mithril_ingot', 'default:mithril_ingot'},
		{'default:mithril_ingot', 'default:mithril_ingot', 'default:mithril_ingot'},
	}
})

minetest.register_craft({
	output = 'default:adamantit_block',
	recipe = {
		{'default:adamantit_ingot', 'default:adamantit_ingot', 'default:adamantit_ingot'},
		{'default:adamantit_ingot', 'default:adamantit_ingot', 'default:adamantit_ingot'},
		{'default:adamantit_ingot', 'default:adamantit_ingot', 'default:adamantit_ingot'},
	}
})

minetest.register_craft({
	output = 'default:khorium_block',
	recipe = {
		{'default:khorium_ingot', 'default:khorium_ingot', 'default:khorium_ingot'},
		{'default:khorium_ingot', 'default:khorium_ingot', 'default:khorium_ingot'},
		{'default:khorium_ingot', 'default:khorium_ingot', 'default:khorium_ingot'},
	}
})

minetest.register_craft({
	output = 'default:kobalt_block',
	recipe = {
		{'default:kobalt_ingot', 'default:kobalt_ingot', 'default:kobalt_ingot'},
		{'default:kobalt_ingot', 'default:kobalt_ingot', 'default:kobalt_ingot'},
		{'default:kobalt_ingot', 'default:kobalt_ingot', 'default:kobalt_ingot'},
	}
})

minetest.register_craft({
	output = 'default:mese',
	recipe = {
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'default:diamond_block',
	recipe = {
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
	}
})

minetest.register_craft({
	output = "default:furnace",
	recipe = {
		{"group:cobble", "group:cobble", "group:cobble"},
		{"group:cobble", "", "group:cobble"},
		{"group:cobble", "group:cobble", "group:cobble"}
	}
})

minetest.register_craft({
	output = "default:sapling",
	recipe = {
		{"default:leaves", "default:leaves", "default:leaves"},
		{"default:leaves", "default:leaves", "default:leaves"},
		{"", "default:stick", ""}
	}
})

minetest.register_craft({
	output = "default:junglesapling",
	recipe = {
		{"default:jungleleaves", "default:jungleleaves", "default:jungleleaves"},
		{"default:jungleleaves", "default:jungleleaves", "default:jungleleaves"},
		{"", "default:stick", ""}
	}
})

minetest.register_craft({
	output = "default:pine_sapling",
	recipe = {
		{"default:pine_needles", "default:pine_needles", "default:pine_needles"},
		{"default:pine_needles", "default:pine_needles", "default:pine_needles"},
		{"", "default:stick", ""}
	}
})

minetest.register_craft({
	output = "default:aspen_sapling",
	recipe = {
		{"default:aspen_leaves", "default:aspen_leaves", "default:aspen_leaves"},
		{"default:aspen_leaves", "default:aspen_leaves", "default:aspen_leaves"},
		{"", "default:stick", ""}
	}
})

minetest.register_craft({
	output = "default:acacia_sapling",
	recipe = {
		{"default:acacia_leaves", "default:acacia_leaves", "default:acacia_leaves"},
		{"default:acacia_leaves", "default:acacia_leaves", "default:acacia_leaves"},
		{"", "default:stick", ""}
	}
})

minetest.register_craft({
	output = "default:water_light",
	recipe = {
		{"default:water_dust", "default:water_dust"},
		{"default:water_dust", "default:water_dust"}
	}
})

minetest.register_craft({
	output = "default:lava_light",
	recipe = {
		{"default:lava_dust", "default:lava_dust"},
		{"default:lava_dust", "default:lava_dust"}
	}
})

minetest.register_craft({
	output = "default:lime",
	recipe = {
		{"default:lime_lump", "default:lime_lump"},
		{"default:lime_lump", "default:lime_lump"}
	}
})

minetest.register_craft({
	output = "default:clay",
	recipe = {
		{"default:clay_lump", "default:clay_lump"},
		{"default:clay_lump", "default:clay_lump"}
	}
})

minetest.register_craft({
	output = 'default:clay_brick',
	recipe = {
		{'default:clay_lump'},
	}
})

minetest.register_craft({
	output = "default:green_kelp_block",
	recipe = {
		{"default:sand_with_green_kelp", "default:sand_with_green_kelp", "default:sand_with_green_kelp"},
		{"default:sand_with_green_kelp", "default:sand_with_green_kelp", "default:sand_with_green_kelp"},
		{"default:sand_with_green_kelp", "default:sand_with_green_kelp", "default:sand_with_green_kelp"}
	}
})

minetest.register_craft({
	output = "default:red_kelp_block",
	recipe = {
		{"default:sand_with_red_kelp", "default:sand_with_red_kelp", "default:sand_with_red_kelp"},
		{"default:sand_with_red_kelp", "default:sand_with_red_kelp", "default:sand_with_red_kelp"},
		{"default:sand_with_red_kelp", "default:sand_with_red_kelp", "default:sand_with_red_kelp"}
	}
})

--
-- Recraft
--

minetest.register_craft({
	output = 'default:silver_sand 4',
	recipe = {
		{'default:stone'},
	}
})

minetest.register_craft({
	output = 'default:diorite',
	recipe = {
		{'default:diorite_smooth'},
	}
})

minetest.register_craft({
	output = 'default:sand 4',
	recipe = {
		{'default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:andesite',
	recipe = {
		{'default:andesite_smooth'},
	}
})

minetest.register_craft({
	output = 'default:desert_sand 4',
	recipe = {
		{'default:desert_stone'},
	}
})

minetest.register_craft({
	output = 'default:granite',
	recipe = {
		{'default:granite_smooth'},
	}
})

minetest.register_craft({
	output = 'default:coal_lump 9',
	recipe = {
		{'default:coalblock'},
	}
})

minetest.register_craft({
	output = 'default:bronze_ingot 9',
	recipe = {
		{'default:bronze_block'},
	}
})

minetest.register_craft({
	output = 'default:steel_ingot 9',
	recipe = {
		{'default:steel_block'},
	}
})

minetest.register_craft({
	output = 'default:silver_ingot 9',
	recipe = {
		{'default:silver_block'},
	}
})

minetest.register_craft({
	output = 'default:gold_ingot 9',
	recipe = {
		{'default:gold_block'},
	}
})

minetest.register_craft({
	output = 'default:mithril_ingot 9',
	recipe = {
		{'default:mithril_block'},
	}
})

minetest.register_craft({
	output = 'default:adamantit_ingot 9',
	recipe = {
		{'default:adamantit_block'},
	}
})

minetest.register_craft({
	output = 'default:khorium_ingot 9',
	recipe = {
		{'default:khorium_block'},
	}
})

minetest.register_craft({
	output = 'default:kobalt_ingot 9',
	recipe = {
		{'default:kobalt_block'},
	}
})

minetest.register_craft({
	output = 'default:mese_crystal 9',
	recipe = {
		{'default:mese'},
	}
})

minetest.register_craft({
	output = 'default:diamond 9',
	recipe = {
		{'default:diamond_block'},
	}
})

minetest.register_craft({
	output = 'default:stick 4',
	recipe = {
		{'group:wood'},
	}
})

minetest.register_craft({
	output = 'default:coal_wood 4',
	recipe = {
		{'default:coal_tree'},
	}
})

minetest.register_craft({
	output = 'default:frost_wood 4',
	recipe = {
		{'default:frost_tree'},
	}
})

minetest.register_craft({
	output = 'default:wood 4',
	recipe = {
		{'default:tree'},
	}
})

minetest.register_craft({
	output = 'default:junglewood 4',
	recipe = {
		{'default:jungletree'},
	}
})

minetest.register_craft({
	output = 'default:pine_wood 4',
	recipe = {
		{'default:pine_tree'},
	}
})

minetest.register_craft({
	output = 'default:aspen_wood 4',
	recipe = {
		{'default:aspen_tree'},
	}
})

minetest.register_craft({
	output = 'default:acacia_wood 4',
	recipe = {
		{'default:acacia_tree'},
	}
})

minetest.register_craft({
	output = 'default:water_dust 4',
	recipe = {
		{'default:water_light'},
	}
})

minetest.register_craft({
	output = 'default:lava_dust 4',
	recipe = {
		{'default:lava_light'},
	}
})

--
-- Shapeless
--

minetest.register_craft({
	type = "shapeless",
	output = "default:coarse_dirt",
	recipe = {"default:dirt", "default:gravel"}
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:gravel',
	recipe = {"default:coarse_dirt"},
	replacements = {{"default:coarse_dirt", "default:dirt"}}
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:paper 4',
	recipe = {"default:papyrus", "default:papyrus", "default:papyrus", "default:papyrus"},
})

minetest.register_craft({
	type = "shapeless",
	output = "default:bronze_ingot 2",
	recipe = {"default:copper_ingot", "default:tin_ingot"},
})

minetest.register_craft({
	type = "shapeless",
	output = "default:steel_ingot 2",
	recipe = {"default:coal_lump", "default:iron_ingot"},
})

minetest.register_craft({
	type = "shapeless",
	output = "default:diamond",
	recipe = {"group:gems", "group:gems", "group:gems", "group:gems"},
})

--
-- Cooking
--

minetest.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:cobble",
	recipe = "default:mossycobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:sandstone",
	recipe = "default:sandcobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:sandcobble",
	recipe = "default:mossy_sandcobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:desert_stone",
	recipe = "default:desert_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:desert_cobble",
	recipe = "default:mossy_desert_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "group:sand",
})

minetest.register_craft({
	type = "cooking",
	output = "default:sugar",
	recipe = "default:papyrus",
})

minetest.register_craft({
	type = "cooking",
	output = "default:copper_lump",
	recipe = "default:stone_with_copper",
})

minetest.register_craft({
	type = "cooking",
	output = "default:copper_ingot",
	recipe = "default:copper_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:tin_lump",
	recipe = "default:stone_with_tin",
})

minetest.register_craft({
	type = "cooking",
	output = "default:tin_ingot",
	recipe = "default:tin_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:iron_lump",
	recipe = "default:stone_with_iron",
})

minetest.register_craft({
	type = "cooking",
	output = "default:iron_ingot",
	recipe = "default:iron_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:silver_lump",
	recipe = "default:stone_with_silver",
})

minetest.register_craft({
	type = "cooking",
	output = "default:silver_ingot",
	recipe = "default:silver_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:gold_lump",
	recipe = "default:stone_with_gold",
})

minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "default:gold_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:adamantit_lump",
	recipe = "default:stone_with_adamantit",
})

minetest.register_craft({
	type = "cooking",
	output = "default:adamantit_ingot",
	recipe = "default:adamantit_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:mithril_lump",
	recipe = "default:stone_with_mithril",
})

minetest.register_craft({
	type = "cooking",
	output = "default:mithril_ingot",
	recipe = "default:mithril_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:khorium_lump",
	recipe = "default:stone_with_khorium",
})

minetest.register_craft({
	type = "cooking",
	output = "default:khorium_ingot",
	recipe = "default:khorium_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:kobalt_lump",
	recipe = "default:stone_with_kobalt",
})

minetest.register_craft({
	type = "cooking",
	output = "default:kobalt_ingot",
	recipe = "default:kobalt_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:backed_clay_lump",
	recipe = "default:clay_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:coal_tree",
	recipe = "group:tree",
})

minetest.register_craft({
	type = "cooking",
	output = "default:coal_wood",
	recipe = "group:wood",
})

minetest.register_craft({
	type = "cooking",
	output = "default:tree",
	recipe = "default:frost_tree",
})

minetest.register_craft({
	type = "cooking",
	output = "default:wood",
	recipe = "default:frost_wood",
})

--
-- Spezial
--

local crystal_list = {
	{ "amethyst"},
	{ "topas"},	
	{ "ruby"},
	{ "saphiere"},
	{ "emerald"},
}

for i in ipairs(crystal_list) do
	local node = crystal_list[i][1]

minetest.register_craft({
	output = 'default:glow_'..node..'_crystal',
	recipe = {
		{'default:'..node, 'default:'..node, 'default:'..node},
		{'default:'..node, 'default:'..node, 'default:'..node},
		{'default:'..node, 'default:'..node, 'default:'..node}
	}
})

minetest.register_craft({
	output = 'default:'..node..' 9',
	recipe = {
		{'default:glow_'..node..'_crystal'},
	}
})

end

local coral_list = {
	{ "cyan"},
	{ "jade"},	
	{ "green"},
	{ "blue"},
	{ "orange"},
	{ "purble"},
	{ "pink"},
	{ "red"},
}

for i in ipairs(coral_list) do
	local node = coral_list[i][1]

minetest.register_craft({
	output = "default:seastone_" .. node,
	recipe = {
		{"default:coral_" .. node, "default:coral_" .. node},
		{"default:coral_" .. node, "default:coral_" .. node}
	}
})

minetest.register_craft({
	output = "default:seabrick_" .. node .. " 4",
	recipe = {
		{"default:seastone_" .. node, "default:seastone_" .. node},
		{"default:seastone_" .. node, "default:seastone_" .. node}
	}
})

minetest.register_craft({
	output = "default:seastone_" .. node .. " 4",
	recipe = {
		{"default:seabrick_" .. node},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "default:dark_seabrick_" .. node,
	recipe = "default:seabrick_" .. node,
})

end

--
-- Fuel
--

minetest.register_craft({
	type = "fuel",
	recipe = "group:stick",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:coal_lump",
	burntime = 40,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:coalblock",
	burntime = 370,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:coal_tree",
	burntime = 40,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:tree",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:jungletree",
	burntime = 38,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:pine_tree",
	burntime = 26,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:aspen_tree",
	burntime = 22,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:acacia_tree",
	burntime = 34,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:coal_wood",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:junglewood",
	burntime = 9,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:pine_wood",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:aspen_wood",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:acacia_wood",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sapling",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:junglesapling",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:pine_sapling",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:aspen_sapling",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:acacia_sapling",
	burntime = 6,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:leaves",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:papyrus",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:paper",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:flora",
	burntime = 1,
})