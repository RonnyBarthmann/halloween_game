local cake_texture = {"cake_top.png","cake_bottom.png","cake_inner.png","cake_side.png","cake_side.png","cake_side.png"}
local slice_1 = { -0.4375, -0.5, -0.4375, -0.3125, 0.0, 0.4375}
local slice_2 = { -0.4375, -0.5, -0.4375, -0.1875, 0.0, 0.4375}
local slice_3 = { -0.4375, -0.5, -0.4375, -0.0625, 0.0, 0.4375}
local slice_4 = { -0.4375, -0.5, -0.4375, 0.0625, 0.0, 0.4375}
local slice_5 = { -0.4375, -0.5, -0.4375, 0.1875, 0.0, 0.4375}
local slice_6 = { -0.4375, -0.5, -0.4375, 0.3125, 0.0, 0.4375}
local slice_7 = { -0.4375, -0.5, -0.4375, 0.4375, 0.0, 0.4375}

minetest.register_craftitem("farming:cake_item", {
	description = "Kuchenstueck",
	inventory_image = "cake_inv.png",
	on_use = minetest.item_eat(2),
	stack_max = 64,
	groups = {food = 1}
})

minetest.register_node("farming:cake", {
	description = "Kuchen",
	tiles = {"cake_top.png","cake_bottom.png","cake_side.png","cake_side.png","cake_side.png","cake_side.png"},
	inventory_image = "cake.png",
	wield_image = "cake.png",
	paramtype = "light",
	is_ground_content = false,
	drawtype = "nodebox",
	selection_box = {
		type = "fixed",
		fixed = slice_7
	},
	node_box = {
		type = "fixed",
			fixed = slice_7
		},
	stack_max = 1,
	groups = {crumbly=3,attached_node=1},
	drop = 'farming:cake_item 7',
	on_rightclick = function(pos, node, clicker, itemstack)
		clicker:set_hp(clicker:get_hp() + 2)
		minetest.do_item_eat(0, ItemStack("farming:cake_6"), ItemStack("farming:cake"), clicker, {type="nothing"})
		minetest.add_node(pos,{type="node",name="farming:cake_6",param2=0})
	end,
	on_use = minetest.item_eat(14),
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:cake_6", {
	description = "Kuchen *6",
	tiles = cake_texture,
	paramtype = "light",
	is_ground_content = false,
	drawtype = "nodebox",
	selection_box = {
		type = "fixed",
		fixed = slice_6
	},
	node_box = {
		type = "fixed",
			fixed = slice_6
		},
	stack_max = 1,
	groups = {crumbly=3,attached_node=1,not_in_creative_inventory=1},
	drop = 'farming:cake_item 6',
	on_rightclick = function(pos, node, clicker, itemstack)
		clicker:set_hp(clicker:get_hp() + 2)
		minetest.do_item_eat(0, ItemStack("farming:cake_5"), ItemStack("farming:cake_6"), clicker, {type="nothing"})
		minetest.add_node(pos,{type="node",name="farming:cake_5",param2=0})
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:cake_5", {
	description = "Kuchen *5",
	tiles = cake_texture,
	paramtype = "light",
	is_ground_content = false,
	drawtype = "nodebox",
	selection_box = {
		type = "fixed",
		fixed = slice_5
	},
	node_box = {
		type = "fixed",
			fixed = slice_5
		},
	groups = {crumbly=3,attached_node=1,not_in_creative_inventory=1},
	drop = 'farming:cake_item 5',
	on_rightclick = function(pos, node, clicker, itemstack)
		clicker:set_hp(clicker:get_hp() + 2)
		minetest.do_item_eat(0, ItemStack("farming:cake_4"), ItemStack("farming:cake_5"), clicker, {type="nothing"})
		minetest.add_node(pos,{type="node",name="farming:cake_4",param2=0})
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:cake_4", {
	description = "Kuchen *4",
	tiles = cake_texture,
	paramtype = "light",
	is_ground_content = false,
	drawtype = "nodebox",
	selection_box = {
		type = "fixed",
		fixed = slice_4
	},
	node_box = {
		type = "fixed",
			fixed = slice_4
		},
	groups = {crumbly=3,attached_node=1,not_in_creative_inventory=1},
	drop = 'farming:cake_item 4',
	on_rightclick = function(pos, node, clicker, itemstack)
		clicker:set_hp(clicker:get_hp() + 2)
		minetest.do_item_eat(0, ItemStack("farming:cake_3"), ItemStack("farming:cake_4"), clicker, {type="nothing"})
		minetest.add_node(pos,{type="node",name="farming:cake_3",param2=0})
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:cake_3", {
	description = "Kuchen *3)",
	tiles = cake_texture,
	paramtype = "light",
	is_ground_content = false,
	drawtype = "nodebox",
	selection_box = {
		type = "fixed",
		fixed = slice_3
	},
	node_box = {
		type = "fixed",
			fixed = slice_3
		},
	groups = {crumbly=3,attached_node=1,not_in_creative_inventory=1},
	drop = 'farming:cake_item 3',
	on_rightclick = function(pos, node, clicker, itemstack)
		clicker:set_hp(clicker:get_hp() + 2)
		minetest.do_item_eat(0, ItemStack("farming:cake_2"), ItemStack("farming:cake_3"), clicker, {type="nothing"})
		minetest.add_node(pos,{type="node",name="farming:cake_2",param2=0})
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:cake_2", {
	description = "Kuchen *2",
	tiles = cake_texture,
	paramtype = "light",
	is_ground_content = false,
	drawtype = "nodebox",
	selection_box = {
		type = "fixed",
		fixed = slice_2
	},
	node_box = {
		type = "fixed",
			fixed = slice_2
		},
	groups = {crumbly=3,attached_node=1,not_in_creative_inventory=1},
	drop = 'farming:cake_item 2',
	on_rightclick = function(pos, node, clicker, itemstack)
		clicker:set_hp(clicker:get_hp() + 2)
		minetest.do_item_eat(0, ItemStack("farming:cake_1"), ItemStack("farming:cake_2"), clicker, {type="nothing"})
		minetest.add_node(pos,{type="node",name="farming:cake_1",param2=0})
	end,
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("farming:cake_1", {
	description = "Kuchen *1",
	tiles = cake_texture,
	paramtype = "light",
	is_ground_content = false,
	drawtype = "nodebox",
	selection_box = {
		type = "fixed",
		fixed = slice_1
	},
	node_box = {
		type = "fixed",
			fixed = slice_1
		},
	groups = {crumbly=3,attached_node=1,not_in_creative_inventory=1},
	drop = 'farming:cake_item',
	on_rightclick = function(pos, node, clicker, itemstack)
		clicker:set_hp(clicker:get_hp() + 2)
		minetest.do_item_eat(0, ItemStack("farming:cake_0"), ItemStack("farming:cake_1"), clicker, {type="nothing"})
		minetest.remove_node(pos)
	end,
	sounds = default.node_sound_leaves_defaults(),
})