gravestones = {}

local function is_owner(pos, name)
	local owner = minetest.get_meta(pos):get_string("owner")
	if owner == "" or owner == name or minetest.check_player_privs(name, "protection_bypass") then
		return true
	end
	return false
end

local gravestones_formspec =
	"size[8,9]" ..
	"list[current_name;main;0,0.3;8,4;]" ..
	"list[current_player;main;0,4.85;8,1;]" ..
	"list[current_player;main;0,6.08;8,3;8]" ..
	"listring[current_name;main]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,4.85)

local share_gravestones_time = tonumber(minetest.settings:get("share_gravestones_time")) or 1200
local share_gravestones_time_early = tonumber(minetest.settings:get("share_gravestones_time_early")) or share_gravestones_time / 4

minetest.register_node("gravestones:ghost", {
	description = "Grabstein",
	drawtype = "nodebox",
	tiles = {
		"gravestones_top.png",
		"gravestones_buttom.png",
		"gravestones_sides.png",
		"gravestones_sides.png",
		"gravestones_back.png",
		"gravestones_front.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	stack_max = 64,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, -0.375, 0.25},
			{-0.5, -0.375, -0.0625, 0.5, 0.25, 0.1875},
			{-0.25, 0.375, -0.0625, 0.25, 0.5, 0.1875},
			{-0.375, 0.25, -0.0625, 0.375, 0.375, 0.1875},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.125, 0.5, -0.375, 0.25},
			{-0.5, -0.375, -0.0625, 0.5, 0.5, 0.1875},
		}
	},
	light_source = default.LIGHT_MAX,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
	can_dig = function(pos, player)
		local inv = minetest.get_meta(pos):get_inventory()
		local name = ""
		if player then
			name = player:get_player_name()
		end
		return is_owner(pos, name) and inv:is_empty("main")
	end,

	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		if is_owner(pos, player:get_player_name()) then
			return count
		end
		return 0
	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		return 0
	end,

	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if is_owner(pos, player:get_player_name()) then
			return stack:get_count()
		end
		return 0
	end,

	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if meta:get_inventory():is_empty("main") then
			local inv = player:get_inventory()
			if inv:room_for_item("main", {name = "gravestones:ghost"}) then
				inv:add_item("main", {name = "gravestones:ghost"})
			else
				minetest.add_item(pos, "gravestones:ghost")
			end
			minetest.remove_node(pos)
		end
	end,

	on_punch = function(pos, node, player)
		if not is_owner(pos, player:get_player_name()) then
			return
		end

		if minetest.get_meta(pos):get_string("infotext") == "" then
			return
		end

		local inv = minetest.get_meta(pos):get_inventory()
		local player_inv = player:get_inventory()
		local has_space = true

		for i = 1, inv:get_size("main") do
			local stk = inv:get_stack("main", i)
			if player_inv:room_for_item("main", stk) then
				inv:set_stack("main", i, nil)
				player_inv:add_item("main", stk)
			else
				has_space = false
				break
			end
		end

		if has_space then
			if player_inv:room_for_item("main", {name = "gravestones:ghost"}) then
				player_inv:add_item("main", {name = "gravestones:ghost"})
			else
				minetest.add_item(pos,"gravestones:ghost")
			end
			minetest.remove_node(pos)
		end
	end,

	on_timer = function(pos, elapsed)
		local meta = minetest.get_meta(pos)
		local time = meta:get_int("time") + elapsed
		if time >= share_gravestones_time then
			meta:set_string("infotext", meta:get_string("owner") .. "'s alter Grabstein")
			meta:set_string("owner", "")
		else
			meta:set_int("time", time)
			return true
		end
	end,
	on_blast = function(pos)
	end,
})

local function may_replace(pos, player)
	local node_name = minetest.get_node(pos).name
	local node_definition = minetest.registered_nodes[node_name]

	if not node_definition then
		return false
	end

	if node_name == "air" or node_definition.liquidtype ~= "none" then
		return true
	end

	local can_dig_func = node_definition.can_dig
	if can_dig_func and not can_dig_func(pos, player) then
		return false
	end

	return node_definition.buildable_to and not minetest.is_protected(pos, player:get_player_name())
end

local drop = function(pos, itemstack)
	local obj = minetest.add_item(pos, itemstack:take_item(itemstack:get_count()))
	if obj then
		obj:setvelocity({
			x = math.random(-10, 10) / 9,
			y = 5,
			z = math.random(-10, 10) / 9,
		})
	end
end

minetest.register_on_dieplayer(function(player)

	local gravestones_mode = minetest.settings:get("gravestones_mode") or "gravestones"
	if gravestones_mode ~= "gravestones" and gravestones_mode ~= "drop" and gravestones_mode ~= "keep" then
		gravestones_mode = "gravestones"
	end

	if gravestones_mode == "keep" or (creative and creative.is_enabled_for
			and creative.is_enabled_for(player:get_player_name())) then
		return
	end

	local player_inv = player:get_inventory()
	if player_inv:is_empty("main") and
		player_inv:is_empty("craft") then
		return
	end

	local pos = vector.round(player:getpos())
	local player_name = player:get_player_name()

	if gravestones_mode == "gravestones" and not may_replace(pos, player) then
		local air = minetest.find_node_near(pos, 1, {"air"})
		if air and not minetest.is_protected(air, player_name) then
			pos = air
		else
			gravestones_mode = "drop"
		end
	end

	if gravestones_mode == "drop" then

		for i = 1, player_inv:get_size("main") do
			drop(pos, player_inv:get_stack("main", i))
		end
		player_inv:set_list("main", {})

		for i = 1, player_inv:get_size("craft") do
			drop(pos, player_inv:get_stack("craft", i))
		end
		player_inv:set_list("craft", {})

		drop(pos, ItemStack("gravestones:ghost"))
		return
	end

	local param2 = minetest.dir_to_facedir(player:get_look_dir())
	minetest.set_node(pos, {name = "gravestones:ghost", param2 = param2})

	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	inv:set_size("main", 8 * 4)
	inv:set_list("main", player_inv:get_list("main"))

	for i = 1, player_inv:get_size("craft") do
		local stack = player_inv:get_stack("craft", i)
		if inv:room_for_item("main", stack) then
			inv:add_item("main", stack)
		else
			--drop if no space left
			drop(pos, stack)
		end
	end

	player_inv:set_list("main", {})
	player_inv:set_list("craft", {})

	meta:set_string("formspec", gravestones_formspec)
	meta:set_string("owner", player_name)

	if share_gravestones_time ~= 0 then
		meta:set_string("infotext", player_name .. "'s neuer Grabstein")

		if share_gravestones_time_early == 0 or not minetest.is_protected(pos, player_name) then
			meta:set_int("time", 0)
		else
			meta:set_int("time", (share_gravestones_time - share_gravestones_time_early))
		end

		minetest.get_node_timer(pos):start(10)
	else
		meta:set_string("infotext", player_name.."'s Grabstein")
	end
end)
