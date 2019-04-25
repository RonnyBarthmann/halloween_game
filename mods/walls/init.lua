walls = {}

walls.register = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node(wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}},
			-- connect_bottom =
			connect_front = {{-0.25, -0.5, -0.5, 0.25, 0.5, -0.25}},
			connect_left = {{-0.5, -0.5, -0.25, -0.25, 0.5, 0.25}},
			connect_back = {{-0.25, -0.5, 0.25, 0.25, 0.5, 0.5}},
			connect_right = {{0.25, -0.5, -0.25, 0.5, 0.5, 0.25}},
		},
		connects_to = { "group:fence_connect", "group:wall", "group:cobble", "group:stone", "group:prisma", "group:wood", "group:tree" },
		paramtype = "light",
		stack_max = 64,
		is_ground_content = false,
		tiles = wall_texture,
		walkable = true,
		groups = { cracky = 2, wall = 1},
		sounds = wall_sounds,
	})

	-- crafting recipe
	minetest.register_craft({
		output = wall_name .. " 6",
		recipe = {
			{ '', '', '' },
			{ wall_mat, wall_mat, wall_mat},
			{ wall_mat, wall_mat, wall_mat},
		}
	})

end

walls.register("walls:cobble", "Bruchsteinmauer", {"default_cobble.png"},
		"default:cobble", default.node_sound_stone_defaults())

walls.register("walls:diorite", "Dioritmauer", {"default_diorite.png"},
		"default:diorite", default.node_sound_stone_defaults())

walls.register("walls:andesite", "Andesitmauer", {"default_andesite.png"},
		"default:andesite", default.node_sound_stone_defaults())

walls.register("walls:granite", "Granitmauer", {"default_granite.png"},
		"default:granite", default.node_sound_stone_defaults())

walls.register("walls:mossycobble", "Bemooster Bruchsteinmauer", {"default_mossycobble.png"},
		"default:mossycobble", default.node_sound_stone_defaults())

walls.register("walls:sandcobble", "Sandige Bruchsteinmauer", {"default_sandcobble.png"},
		"default:sandcobble", default.node_sound_stone_defaults())

walls.register("walls:mossy_sandcobble", "Bemooste Sandbruchsteinmauer", {"default_mossy_sandcobble.png"},
		"default:mossy_sandcobble", default.node_sound_stone_defaults())

walls.register("walls:desert_cobble", "Wuestenbruchsteinmauer", {"default_desert_cobble.png"},
		"default:desert_cobble", default.node_sound_stone_defaults())

walls.register("walls:mossy_desert_cobble", "Bemooste Wuestenbruchsteinmauer", {"default_mossy_desert_cobble.png"},
		"default:mossy_desert_cobble", default.node_sound_stone_defaults())

walls.register("walls:seastone_cyan", "Cyan Steinkorallenmauer", {"default_seastone_cyan.png"},
		"default:seastone_cyan", default.node_sound_stone_defaults())

walls.register("walls:seastone_jade", "Jade Steinkorallenmauer", {"default_seastone_jade.png"},
		"default:seastone_jade", default.node_sound_stone_defaults())

walls.register("walls:seastone_green", "Gruene Steinkorallenmauer", {"default_seastone_green.png"},
		"default:seastone_green", default.node_sound_stone_defaults())

walls.register("walls:seastone_blue", "Blaue Steinkorallenmauer", {"default_seastone_blue.png"},
		"default:seastone_blue", default.node_sound_stone_defaults())

walls.register("walls:seastone_orange", "Orange Steinkorallenmauer", {"default_seastone_orange.png"},
		"default:seastone_orange", default.node_sound_stone_defaults())

walls.register("walls:seastone_purble", "Lilane Steinkorallenmauer", {"default_seastone_purble.png"},
		"default:seastone_purble", default.node_sound_stone_defaults())

walls.register("walls:seastone_pink", "Pinke Steinkorallenmauer", {"default_seastone_pink.png"},
		"default:seastone_pink", default.node_sound_stone_defaults())

walls.register("walls:seastone_red", "Rote Steinkorallenmauer", {"default_seastone_red.png"},
		"default:seastone_red", default.node_sound_stone_defaults())