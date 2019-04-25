local hive = {}
local honey_max = 64

minetest.register_abm({
	nodenames = {"default:pine_tree"},
	neighbors = {"default:pine_needles"},
	interval = 100,
	chance = 150,
	catch_up = false,
	action = function(pos, node)

		local dir = math.random(1, 50)

		if dir == 1 then
			pos.x = pos.x + 1
		elseif dir == 2 then
			pos.x = pos.x - 1
		elseif dir == 3 then
			pos.z = pos.z + 1
		elseif dir == 4 then
			pos.z = pos.z -1
		else return
		end

		local pos0 = vector.subtract(pos, 6)
		local pos1 = vector.add(pos, 6)

			if #minetest.find_nodes_in_area(pos0, pos1, "group:hive") > 2 then
				return
			end

		local nodename = minetest.get_node(pos).name

		if nodename == "air" and 
			minetest.get_node_light(pos) > 10 then

			minetest.set_node(pos, {
				name = "farming:hive_spawn"
			})
		end
	end,
})

function hive.construct(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

	local formspec = [[ size[8,5;]
			label[0.5,0;Bienen sind dabei, Honig zu machen...]
			image[6,0;1,1;farming_hive_bee.png]
			image[5,0;1,1;farming_hive_layout.png]
			list[context;honey;5,0;1,1;]
			list[current_player;main;0,1.35;8,4;] ]]
			..xbg..default.get_hotbar_bg(0,1.35)

	meta:set_string("formspec", formspec)
	meta:set_string("infotext", "Bienenstock")
	inv:set_size("honey", 1)

	local timer = minetest.get_node_timer(pos)
	timer:start(math.random(64, 128))
end

function hive.timer(pos)
	local time = (minetest.get_timeofday() or 0) * 24000
	if time < 5500 or time > 18500 then return true end

	local inv = minetest.get_meta(pos):get_inventory()
	local honeystack = inv:get_stack("honey", 1)
	local honey = honeystack:get_count()

	local radius = 10
	local minp = vector.add(pos, -radius)
	local maxp = vector.add(pos, radius)
	local flowers = minetest.find_nodes_in_area_under_air(minp, maxp, "group:flower")

	if #flowers > 2 and honey < honey_max then
		inv:add_item("honey", "farming:honeycomb")
	elseif honey == honey_max then
		local timer = minetest.get_node_timer(pos)
		timer:stop() return true
	end
	return true
end	

minetest.register_node("farming:hive", {
	description = "Bienenstock",
	tiles = {"farming_hive_top.png", "farming_hive_top.png",
		 "farming_hive_side.png", "farming_hive_side.png",
		 "farming_hive_side.png", "farming_hive_front.png"},
	groups = {oddly_breakable_by_hand=3, leafdecay = 1, leafdecay_drop = 1, hive = 1},
	paramtype2 = "facedir",
	stack_max = 64,
	on_construct = hive.construct,
	on_timer = hive.timer,
	can_dig = function(pos)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("honey")
	end,
	on_punch = function(_, _, puncher)
		puncher:set_hp(puncher:get_hp() - 2)
	end,
	allow_metadata_inventory_put = function() return 0 end,
	on_metadata_inventory_take = function(pos, _, _, stack)
		if stack:get_count() == honey_max then
			local timer = minetest.get_node_timer(pos)
			timer:start(math.random(64, 128))
		end
	end
})

minetest.register_node("farming:hive_spawn", {
	description = "Bienenstock",
	paramtype = "light",
	tiles = {"farming_hive_top.png", "farming_hive_top.png",
		 "farming_hive_side.png", "farming_hive_side.png",
		 "farming_hive_side.png", "farming_hive_front.png"
	},
	walkable = true,
	drop = 'farming:hive',
	stack_max = 64,
	groups = {oddly_breakable_by_hand=3, not_in_creative_inventory=1, hive = 1},
	sounds = default.node_sound_wood_defaults(),
	on_punch = function(_, _, puncher)
		puncher:set_hp(puncher:get_hp() - 2)
	end,
})

minetest.register_craftitem("farming:honey", {
	description = "Honig",
	inventory_image = "farming_honey.png",
	wield_image = "farming_honey.png",
	stack_max = 64,
	on_use = minetest.item_eat(2)
})

minetest.register_craftitem("farming:honeycomb", {
	description = "Honigwabe",
	inventory_image = "farming_honeycomb.png",
	stack_max = 64,
})

minetest.register_craftitem("farming:beewax", {
	description = "Bienenwachs",
	inventory_image = "farming_beewax.png",
	stack_max = 64,
})