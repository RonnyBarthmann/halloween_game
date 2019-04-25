minetest.register_craft({
	output = 'farming:cake',
	recipe = {
		{'farming:cake_item', 'farming:cake_item', 'farming:cake_item'},
		{'farming:cake_item', 'farming:cake_item', 'farming:cake_item'},
		{'farming:cake_item', 'farming:cake_item', 'farming:cake_item'},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'farming:cake_item 9',
	recipe = {"farming:cake", "farming:swiss_army_knife"},
	replacements = {{"farming:swiss_army_knife", "farming:swiss_army_knife"}}
})

minetest.register_craft({
	output = 'farming:straw',
	recipe = {
		{'farming:wheat_item', 'farming:wheat_item', 'farming:wheat_item'},
		{'farming:wheat_item', 'farming:wheat_item', 'farming:wheat_item'},
		{'farming:wheat_item', 'farming:wheat_item', 'farming:wheat_item'},
	}
})

minetest.register_craft({
	output = "farming:wheat_item 9",
	recipe = {{"farming:straw"}}
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:straw",
	burntime = 18,
})

minetest.register_craft({
	output = "farming:melon_seeds",
	recipe = {{"farming:melon_item"}}
})

minetest.register_craft({
	type = "shapeless",
	output = 'farming:melon_item 9',
	recipe = {"farming:melon", "farming:swiss_army_knife"},
	replacements = {{"farming:swiss_army_knife", "farming:swiss_army_knife"}}
})

minetest.register_craft({
	output = 'farming:melon',
	recipe = {
		{'farming:melon_item', 'farming:melon_item', 'farming:melon_item'},
		{'farming:melon_item', 'farming:melon_item', 'farming:melon_item'},
		{'farming:melon_item', 'farming:melon_item', 'farming:melon_item'},
	}
})

minetest.register_craft({
	output = "farming:pumpkin_seeds",
	recipe = {{"farming:pumpkin_item"}}
})

minetest.register_craft({
	type = "shapeless",
	output = 'farming:pumpkin_item 9',
	recipe = {"farming:pumpkin", "farming:swiss_army_knife"},
	replacements = {{"farming:swiss_army_knife", "farming:swiss_army_knife"}}
})

minetest.register_craft({
	output = 'farming:pumpkin',
	recipe = {
		{'farming:pumpkin_item', 'farming:pumpkin_item', 'farming:pumpkin_item'},
		{'farming:pumpkin_item', 'farming:pumpkin_item', 'farming:pumpkin_item'},
		{'farming:pumpkin_item', 'farming:pumpkin_item', 'farming:pumpkin_item'},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:flour",
	recipe = {"farming:wheat_item", "farming:wheat_item", "farming:wheat_item", "farming:wheat_item"}
})

minetest.register_craft({
	type = "shapeless",
	output = 'farming:bread',
	recipe = {"farming:bread_with_worm"},
	replacements = {{"farming:bread_with_worm", "default:worm"}}
})

minetest.register_craft({
	type = "cooking",
	output = "farming:bread",
	recipe = "farming:flour",
	cooktime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:wheat_item",
	burntime = 2,
})

minetest.register_craft({
	type = "cooking",
	output = "farming:baked_potato",
	recipe = "farming:potato_item",
	cooktime = 5,
})

minetest.register_craft({
	type = "shapeless",
	output = "farming:pumpkinlantern_off",
	recipe = {"default:torch", "farming:pumpkin"}
})

minetest.register_craft({
	type = "shapeless",
	output = 'farming:honey 7',
	recipe = {"farming:honeycomb"},
	replacements = {{"farming:honeycomb", "farming:beewax"}}
})

minetest.register_craft({
	output = "farming:corn_seeds 4",
	recipe = {{"farming:corn_item"}}
})

minetest.register_craft({
	type = "cooking",
	output = "farming:popcorn",
	recipe = "farming:corn_seeds"
})

minetest.register_craft({
	output = 'farming:hemp_rope',
	recipe = {
		{'farming:hemp_item'},
		{'farming:hemp_item'},
		{'farming:hemp_item'},
	}
})