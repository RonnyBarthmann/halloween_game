minetest.register_node("default:stone_with_coal", {
	description = "Steinkohle",
	tiles = {"default_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	stack_max = 64,
	drop = "default:coal_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_copper", {
	description = "Kupfererz",
	tiles = {"default_stone.png^default_mineral_copper.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:topas'}, rarity = 20},
			{items = {'default:stone_with_copper'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_tin", {
	description = "Zinnerz",
	tiles = {"default_stone.png^default_mineral_tin.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:emerald'}, rarity = 20},
			{items = {'default:stone_with_tin'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_iron", {
	description = "Eisenerz",
	tiles = {"default_stone.png^default_mineral_iron.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:ruby'}, rarity = 20},
			{items = {'default:stone_with_iron'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_silver", {
	description = "Silbererz",
	tiles = {"default_stone.png^default_mineral_silver.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:saphiere'}, rarity = 20},
			{items = {'default:stone_with_silver'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_gold", {
	description = "Golderz",
	tiles = {"default_stone.png^default_mineral_gold.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:topas'}, rarity = 20},
			{items = {'default:stone_with_gold'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_mithril", {
	description = "Mithrilerz",
	tiles = {"default_stone.png^default_mineral_mithril.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:emerald'}, rarity = 20},
			{items = {'default:stone_with_mithril'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_adamantit", {
	description = "Adamantiterz",
	tiles = {"default_stone.png^default_mineral_adamantit.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:amethyst'}, rarity = 20},
			{items = {'default:stone_with_adamantit'}}
		}
	},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_khorium", {
	description = "Khoriumerz",
	tiles = {"default_stone.png^default_mineral_khorium.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:ruby'}, rarity = 20},
			{items = {'default:stone_with_khorium'}}
		}
	},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_kobalt", {
	description = "Kobalterz",
	tiles = {"default_stone.png^default_mineral_kobalt.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:diamond'}, rarity = 20},
			{items = {'default:stone_with_kobalt'}}
		}
	},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_coal", {
	description = "Steinkohle",
	tiles = {"default_sandstone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	stack_max = 64,
	drop = "default:coal_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_copper", {
	description = "Kupfererz",
	tiles = {"default_sandstone.png^default_mineral_copper.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:topas'}, rarity = 20},
			{items = {'default:sandstone_with_copper'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_tin", {
	description = "Zinnerz",
	tiles = {"default_sandstone.png^default_mineral_tin.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:emerald'}, rarity = 20},
			{items = {'default:sandstone_with_tin'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_iron", {
	description = "Eisenerz",
	tiles = {"default_sandstone.png^default_mineral_iron.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:ruby'}, rarity = 20},
			{items = {'default:sandstone_with_iron'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_silver", {
	description = "Silbererz",
	tiles = {"default_sandstone.png^default_mineral_silver.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:saphiere'}, rarity = 20},
			{items = {'default:sandstone_with_silver'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_gold", {
	description = "Golderz",
	tiles = {"default_sandstone.png^default_mineral_gold.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:topas'}, rarity = 20},
			{items = {'default:sandstone_with_gold'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_mithril", {
	description = "Mithrilerz",
	tiles = {"default_sandstone.png^default_mineral_mithril.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:emerald'}, rarity = 20},
			{items = {'default:sandstone_with_mithril'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_adamantit", {
	description = "Adamantiterz",
	tiles = {"default_sandstone.png^default_mineral_adamantit.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:amethyst'}, rarity = 20},
			{items = {'default:sandstone_with_adamantit'}}
		}
	},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_khorium", {
	description = "Khoriumerz",
	tiles = {"default_sandstone.png^default_mineral_khorium.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:ruby'}, rarity = 20},
			{items = {'default:sandstone_with_khorium'}}
		}
	},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:sandstone_with_kobalt", {
	description = "Kobalterz",
	tiles = {"default_sandstone.png^default_mineral_kobalt.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:diamond'}, rarity = 20},
			{items = {'default:sandstone_with_kobalt'}}
		}
	},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_coal", {
	description = "Steinkohle",
	tiles = {"default_desert_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	stack_max = 64,
	drop = "default:coal_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_copper", {
	description = "Kupfererz",
	tiles = {"default_desert_stone.png^default_mineral_copper.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:topas'}, rarity = 20},
			{items = {'default:desert_stone_with_copper'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_tin", {
	description = "Zinnerz",
	tiles = {"default_desert_stone.png^default_mineral_tin.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:emerald'}, rarity = 20},
			{items = {'default:desert_stone_with_tin'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_iron", {
	description = "Eisenerz",
	tiles = {"default_desert_stone.png^default_mineral_iron.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:ruby'}, rarity = 20},
			{items = {'default:desert_stone_with_iron'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_silver", {
	description = "Silbererz",
	tiles = {"default_desert_stone.png^default_mineral_silver.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:saphiere'}, rarity = 20},
			{items = {'default:desert_stone_with_silver'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_gold", {
	description = "Golderz",
	tiles = {"default_desert_stone.png^default_mineral_gold.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:topas'}, rarity = 20},
			{items = {'default:desert_stone_with_gold'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_mithril", {
	description = "Mithrilerz",
	tiles = {"default_desert_stone.png^default_mineral_mithril.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:emerald'}, rarity = 20},
			{items = {'default:desert_stone_with_mithril'}}
		}
	},
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_adamantit", {
	description = "Adamantiterz",
	tiles = {"default_desert_stone.png^default_mineral_adamantit.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:amethyst'}, rarity = 20},
			{items = {'default:desert_stone_with_adamantit'}}
		}
	},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_khorium", {
	description = "Khoriumerz",
	tiles = {"default_desert_stone.png^default_mineral_khorium.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:ruby'}, rarity = 20},
			{items = {'default:desert_stone_with_khorium'}}
		}
	},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_kobalt", {
	description = "Kobalterz",
	tiles = {"default_desert_stone.png^default_mineral_kobalt.png"},
	stack_max = 64,
	drop = {
		max_items = 2,
		items = {
			{items = {'default:diamond'}, rarity = 20},
			{items = {'default:desert_stone_with_kobalt'}}
		}
	},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

local mese_timer1 = 25.0
local mese_stone_ore_activate = function(pos)
	minetest.swap_node(pos, {name="default:stone_with_mese_lit"})
	local lit = minetest.get_node_timer(pos)
	lit:start(mese_timer1)
end

minetest.register_node("default:stone_with_mese", {
	description = "Meseerz",
	tiles = {"default_stone.png^default_mineral_mese.png"},
	groups = {cracky = 2, level = 2},
	drop = "default:mese_crystal",
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
	on_punch = mese_stone_ore_activate,
	on_walk_over = mese_stone_ore_activate,
})

local mese_stone_ore_reactivate = function(pos)
	local lit = minetest.get_node_timer(pos)
	lit:start(mese_timer1)
end

minetest.register_node("default:stone_with_mese_lit", {
	description = "Meseerz",
	tiles = {"default_stone.png^default_mineral_mese.png"},
	groups = {cracky = 2, level = 2, not_in_creative_inventory = 1},
	stack_max = 64,
	drop = "default:mese_crystal",
	light_source = default.LIGHT_MAX - 4,
	sounds = default.node_sound_stone_defaults(),
	on_punch = mese_stone_ore_reactivate,
	on_walk_over = mese_stone_ore_reactivate,
	on_timer = function(pos, elapsed)
		minetest.swap_node(pos, {name="default:stone_with_mese"})
	end,
})

local mese_timer2 = 25.0
local mese_sandstone_ore_activate = function(pos)
	minetest.swap_node(pos, {name="default:sandstone_with_mese_lit"})
	local lit = minetest.get_node_timer(pos)
	lit:start(mese_timer2)
end

minetest.register_node("default:sandstone_with_mese", {
	description = "Meseerz",
	tiles = {"default_sandstone.png^default_mineral_mese.png"},
	groups = {cracky = 2, level = 2},
	drop = "default:mese_crystal",
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
	on_punch = mese_sandstone_ore_activate,
	on_walk_over = mese_sandstone_ore_activate,
})

local mese_sandstone_ore_reactivate = function(pos)
	local lit = minetest.get_node_timer(pos)
	lit:start(mese_timer2)
end

minetest.register_node("default:sandstone_with_mese_lit", {
	description = "Meseerz",
	tiles = {"default_sandstone.png^default_mineral_mese.png"},
	groups = {cracky = 2, level = 2, not_in_creative_inventory = 1},
	stack_max = 64,
	drop = "default:mese_crystal",
	light_source = default.LIGHT_MAX - 4,
	sounds = default.node_sound_stone_defaults(),
	on_punch = mese_sandstone_ore_reactivate,
	on_walk_over = mese_sandstone_ore_reactivate,
	on_timer = function(pos, elapsed)
		minetest.swap_node(pos, {name="default:sandstone_with_mese"})
	end,
})

local mese_timer3 = 25.0
local mese_desert_stone_ore_activate = function(pos)
	minetest.swap_node(pos, {name="default:desert_stone_with_mese_lit"})
	local lit = minetest.get_node_timer(pos)
	lit:start(mese_timer3)
end

minetest.register_node("default:desert_stone_with_mese", {
	description = "Meseerz",
	tiles = {"default_desert_stone.png^default_mineral_mese.png"},
	groups = {cracky = 2, level = 2},
	drop = "default:mese_crystal",
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
	on_punch = mese_desert_stone_ore_activate,
	on_walk_over = mese_desert_stone_ore_activate,
})

local mese_desert_stone_ore_reactivate = function(pos)
	local lit = minetest.get_node_timer(pos)
	lit:start(mese_timer3)
end

minetest.register_node("default:desert_stone_with_mese_lit", {
	description = "Meseerz",
	tiles = {"default_desert_stone.png^default_mineral_mese.png"},
	groups = {cracky = 2, level = 2, not_in_creative_inventory = 1},
	stack_max = 64,
	drop = "default:mese_crystal",
	light_source = default.LIGHT_MAX - 4,
	sounds = default.node_sound_stone_defaults(),
	on_punch = mese_desert_stone_ore_reactivate,
	on_walk_over = mese_desert_stone_ore_reactivate,
	on_timer = function(pos, elapsed)
		minetest.swap_node(pos, {name="default:desert_stone_with_mese"})
	end,
})

minetest.register_node("default:coalblock", {
	description = "Kohleblock",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:bronze_block", {
	description = "Bronzeblock",
	tiles = {"default_bronze_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:steel_block", {
	description = "Stahlblock",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 3, fence_connect = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:silver_block", {
	description = "Silverblock",
	tiles = {"default_silver_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:gold_block", {
	description = "Goldblock",
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:mithril_block", {
	description = "Mithrilblock",
	tiles = {"default_mithril_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 2, fence_connect = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:adamantit_block", {
	description = "Adamantitblock",
	tiles = {"default_adamantit_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:khorium_block", {
	description = "Khoriumblock",
	tiles = {"default_khorium_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:kobalt_block", {
	description = "Kobaltblock",
	tiles = {"default_kobalt_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("default:mese", {
	description = "Mese",
	tiles = {"default_mese.png"},
	paramtype = "light",
	light_source = 10,
	stack_max = 64,
	groups = {cracky = 2, level = 2, fence_connect = 1},
	sounds = default.node_sound_stone_defaults(),
})

local crystal_list = {
	{ "amethyst", "Amethyst"},
	{ "topas", "Topas"},	
	{ "ruby", "Rubin"},
	{ "saphiere", "Saphier"},
	{ "emerald", "Smaragd"},
}

for i in ipairs(crystal_list) do
	local node = crystal_list[i][1]
	local desc = crystal_list[i][2]

minetest.register_node("default:glow_"..node.."_crystal", {
	description = desc.."block",
	drawtype = "glasslike",
	paramtype = "light",
	tiles = {"default_glow_"..node.."_crystal.png"},
	is_ground_content = true,
	use_texture_alpha = true,
	sunlight_propagates = true,
	light_source = 12,
	stack_max = 64,
	groups = {cracky=2, fence_connect = 1},
	sounds = default.node_sound_glass_defaults(),
})

end

minetest.register_node("default:diamond_block", {
	description = "Diamantblock",
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 1, fence_connect = 1},
	sounds = default.node_sound_glass_defaults(),
})