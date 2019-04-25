coffin.register_coffin("coffin:coffin", {
	description = "Sarg",
	inventory_image = "coffin_coffin.png",
	wield_image = "coffin_coffin.png",
	tiles = {
		bottom = {
			"coffin_top_bottom.png^[transformR90",
			"coffin_buttom_bottom.png^[transformR90",
			"coffin_side_bottom_r.png",
			"coffin_side_bottom_r.png^[transformfx",
			"coffin_transparent.png",
			"coffin_side_bottom.png"
		},
		top = {
			"coffin_top_top.png^[transformR90",
			"coffin_buttom_top.png^[transformR90",
			"coffin_side_top_r.png",
			"coffin_side_top_r.png^[transformfx",
			"coffin_side_top.png",
			"coffin_transparent.png",
		}
	},
	nodebox = {
		bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
		top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"", "signs:wall_sign", ""},
		{"group:wool", "group:wool", "group:wool"},
		{"group:wood", "group:wood", "group:wood"}
	},
})

minetest.register_craft({
	type = "fuel",
	recipe = "coffin:coffin_bottom",
	burntime = 55,
})
