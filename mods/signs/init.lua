﻿
local chars_file = io.open(minetest.get_modpath("signs").."/characters", "r")
local charmap = {}
if not chars_file then
else
	while true do
		local char = chars_file:read("*l")
		if char == nil then
			break
		end
		local img = chars_file:read("*l")
		chars_file:read("*l")
		charmap[char] = img
	end
end

local SIGN_WIDTH = 115

local LINE_LENGTH = 15
local NUMBER_OF_LINES = 4

local LINE_HEIGHT = 14
local CHAR_WIDTH = 5

local function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

local string_to_array = function(str)
	local tab = {}
	for i=1,string.len(str) do
		table.insert(tab, string.sub(str, i,i))
	end
	return tab
end

local string_to_line_array = function(str)
	local tab = {}
	local current = 1
	local linechar = 1
	tab[1] = ""
	for _,char in ipairs(string_to_array(str)) do
		-- New line
		if char == "\n" then
			current = current + 1
			tab[current] = ""
			linechar = 1
		-- This check cuts off overlong lines
		elseif linechar <= LINE_LENGTH then
			tab[current] = tab[current]..char
			linechar = linechar + 1
		end
	end
	return tab
end

local create_lines = function(text)
	local line_num = 1
	local tab = {}
	for _, line in ipairs(string_to_line_array(text)) do
		if line_num > NUMBER_OF_LINES then
			break
		end
		table.insert(tab, line)
		line_num = line_num + 1
	end
	return tab
end

local generate_line = function(s, ypos)
	local i = 1
	local parsed = {}
	local width = 0
	local chars = 0
	local printed_char_width = CHAR_WIDTH + 1
	while chars <= LINE_LENGTH and i <= #s do
		local file = nil
		if charmap[s:sub(i, i)] ~= nil then
			file = charmap[s:sub(i, i)]
			i = i + 1
		elseif i < #s and charmap[s:sub(i, i + 1)] ~= nil then
			file = charmap[s:sub(i, i + 1)]
			i = i + 2
		else
			i = i + 1
		end
		if file ~= nil then
			width = width + printed_char_width
			table.insert(parsed, file)
			chars = chars + 1
		end
	end
	width = width - 1

	local texture = ""
	local xpos = math.floor((SIGN_WIDTH - width) / 2)
	for i = 1, #parsed do
		texture = texture..":"..xpos..","..ypos.."="..parsed[i]..".png"
		xpos = xpos + printed_char_width
	end
	return texture
end

local generate_texture = function(lines, signnodename)
	local texture = "[combine:"..SIGN_WIDTH.."x"..SIGN_WIDTH
	local ypos
	if signnodename == "signs:wall_sign" then
		ypos = 29
	else
		ypos = -2
	end
	for i = 1, #lines do
		texture = texture..generate_line(lines[i], ypos)
		ypos = ypos + LINE_HEIGHT
	end
	return texture
end

local n = 23/56 - 1/128

local signtext_info_wall = {
	{delta = {x = 0, y = 0, z = n}, yaw = 0},
	{delta = {x = n, y = 0, z = 0}, yaw = math.pi / -2},
	{delta = {x = 0, y = 0, z = -n}, yaw = math.pi},
	{delta = {x = -n, y = 0, z = 0}, yaw = math.pi / 2},
}

local signtext_info_standing = {}

local m = -1/16 + 1/64
for rot=0, 15 do
	local yaw = math.pi*2 - (((math.pi*2) / 16) * rot)
	local delta = vector.multiply(minetest.yaw_to_dir(yaw), m)
	delta.y = delta.y + 2/28
	table.insert(signtext_info_standing, { delta = delta, yaw = yaw })
end

local function get_rotation_level(facedir, nodename)
	local rl = facedir * 4
	if nodename == "signs:standing_sign22_5" then
		rl = rl + 1
	elseif nodename == "signs:standing_sign45" then
		rl = rl + 2
	elseif nodename == "signs:standing_sign67_5" then
		rl = rl + 3
	end
	return rl
end

local function get_wall_signtext_info(param2, nodename)
	local dir = minetest.wallmounted_to_dir(param2)
	if dir.x > 0 then
		return 2
	elseif dir.z > 0 then
		return 1
	elseif dir.x < 0 then
		return 4
	else
		return 3
	end
end

local sign_groups = {choppy = 3, oddly_breakable_by_hand = 3, flammable = 2, attached_node=1}

local destruct_sign = function(pos)
	local objects = minetest.get_objects_inside_radius(pos, 0.5)
	for _, v in ipairs(objects) do
		local ent = v:get_luaentity()
		if ent and ent.name == "signs:text" then
			v:remove()
		end
	end
end

local update_sign = function(pos, fields, sender)
	local meta = minetest.get_meta(pos)
	if not meta then
		return
	end
	local text = meta:get_string("text")
	if fields and (text == "" and fields.text) then
		meta:set_string("text", fields.text)
		text = fields.text
	end
	if text == nil then
		text = ""
	end
	local objects = minetest.get_objects_inside_radius(pos, 0.5)
	for _, v in ipairs(objects) do
		local ent = v:get_luaentity()
		if ent and ent.name == "signs:text" then
			v:set_properties({textures={generate_texture(create_lines(text), ent._signnodename)}})
			return
		end
	end
	
	local sign_info
	local n = minetest.get_node(pos)
	local nn = n.name
	if nn == "signs:standing_sign" or nn == "signs:standing_sign22_5" or nn == "signs:standing_sign45" or nn == "signs:standing_sign67_5" then
		sign_info = signtext_info_standing[get_rotation_level(n.param2, nn) + 1]
	elseif nn == "signs:wall_sign" then
		sign_info = signtext_info_wall[get_wall_signtext_info(n.param2)]
	end
	if sign_info == nil then
		return
	end
	local text_entity = minetest.add_entity({
			x = pos.x + sign_info.delta.x,
			y = pos.y + sign_info.delta.y,
			z = pos.z + sign_info.delta.z}, "signs:text")
	text_entity:get_luaentity()._signnodename = nn
	text_entity:set_properties({textures={generate_texture(create_lines(text), nn)}})

	text_entity:set_yaw(sign_info.yaw)
end

local show_formspec = function(player, pos)
	minetest.show_formspec(
		player:get_player_name(),
		"signs:set_text_"..pos.x.."_"..pos.y.."_"..pos.z,
		"size[6,3]textarea[0.25,0.25;6,1.5;text;Schildtext bearbeiten:;]label[0,1.5;Max Zeichen: 15\nMax Zeilen: 4]button_exit[0,2.5;6,1;submit;Fertig]"
	)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname:find("signs:set_text_") == 1 then
		local x, y, z = formname:match("signs:set_text_(.-)_(.-)_(.*)")
		local pos = {x=tonumber(x), y=tonumber(y), z=tonumber(z)}
		if not pos or not pos.x or not pos.y or not pos.z then return end
		update_sign(pos, fields, player)
	end
end)

local node_sounds
if minetest.get_modpath("default") then
	node_sounds = default.node_sound_wood_defaults()
end

minetest.register_node("signs:wall_sign", {
	description = "Schild",
	inventory_image = "default_sign.png",
	walkable = false,
	is_ground_content = false,
	wield_image = "default_sign.png",
	node_placement_prediction = "",
	paramtype = "light",
	sunlight_propagates = true,
	paramtype2 = "wallmounted",
	drawtype = "mesh",
	mesh = "signs_signonwallmount.obj",
	selection_box = {type = "wallmounted", wall_side = {-0.5, -7/28, -0.5, -23/56, 7/28, 0.5}},
	tiles = {"signs_sign.png"},
	groups = sign_groups,
	stack_max = 16,
	sounds = node_sounds,

	on_place = function(itemstack, placer, pointed_thing)
		local above = pointed_thing.above
		local under = pointed_thing.under

		local node_under = minetest.get_node(under)
		if placer and not placer:get_player_control().sneak then
			if minetest.registered_nodes[node_under.name] and minetest.registered_nodes[node_under.name].on_rightclick then
				return minetest.registered_nodes[node_under.name].on_rightclick(under, node_under, placer, itemstack) or itemstack
			end
		end

		local dir = vector.subtract(under, above)

		local abovenodedef = minetest.registered_nodes[minetest.get_node(above).name]
		if not abovenodedef or abovenodedef.buildable_to == false then
			return itemstack
		end

		local wdir = minetest.dir_to_wallmounted(dir)

		local placer_pos = placer:get_pos()

		local fdir = minetest.dir_to_facedir(dir)

		local sign_info
		local nodeitem = ItemStack(itemstack)
		if wdir == 0 then
			return itemstack
		elseif wdir == 1 then
			local yaw = math.pi*2 - placer:get_look_horizontal()

			local rotation_level = round((yaw / (math.pi*2)) * 16)

			if rotation_level > 15 then
				rotation_level = 0
			elseif rotation_level < 0 then
				rotation_level = 15
			end

			if rotation_level % 4 == 0 then
				nodeitem:set_name("signs:standing_sign")
			elseif rotation_level % 4 == 1 then
				nodeitem:set_name("signs:standing_sign22_5")
			elseif rotation_level % 4 == 2 then
				nodeitem:set_name("signs:standing_sign45")
			elseif rotation_level % 4 == 3 then
				nodeitem:set_name("signs:standing_sign67_5")
			end
			fdir = math.floor(rotation_level / 4)

			local _, success = minetest.item_place_node(nodeitem, placer, pointed_thing, fdir)
			if not success then
				return itemstack
			end
			if not minetest.settings:get_bool("creative_mode") then
				itemstack:take_item()
			end
			sign_info = signtext_info_standing[rotation_level + 1]
		else
			local _, success = minetest.item_place_node(itemstack, placer, pointed_thing, wdir)
			if not success then
				return itemstack
			end
			sign_info = signtext_info_wall[fdir + 1]
		end

		local place_pos
		if minetest.registered_nodes[node_under.name].buildable_to then
			place_pos = under
		else
			place_pos = above
		end

		local text_entity = minetest.add_entity({
			x = place_pos.x + sign_info.delta.x,
			y = place_pos.y + sign_info.delta.y,
			z = place_pos.z + sign_info.delta.z}, "signs:text")
		text_entity:set_yaw(sign_info.yaw)
		text_entity:get_luaentity()._signnodename = nodeitem:get_name()

		minetest.sound_play({name="default_place_node_hard", gain=1.0}, {pos = place_pos})

		show_formspec(placer, place_pos)
		return itemstack
	end,
	on_destruct = destruct_sign,
	on_punch = function(pos, node, puncher)
		update_sign(pos)
	end,
})

local on_rotate
if minetest.get_modpath("screwdriver") then
	on_rotate = screwdriver.disallow
end

local ssign = {
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	paramtype2 = "facedir",
	drawtype = "mesh",
	mesh = "signs_sign.obj",
	selection_box = {type = "fixed", fixed = {-0.2, -0.5, -0.2, 0.2, 0.5, 0.2}},
	tiles = {"signs_sign.png"},
	groups = sign_groups,
	drop = "signs:wall_sign",
	stack_max = 16,
	sounds = node_sounds,

	on_destruct = destruct_sign,
	on_punch = function(pos, node, puncher)
		update_sign(pos)
	end,

	on_rotate = on_rotate,
}

minetest.register_node("signs:standing_sign", ssign)
local ssign22_5 = table.copy(ssign)
ssign22_5.mesh = "signs_sign22.5.obj"

minetest.register_node("signs:standing_sign22_5", ssign22_5)
local ssign45 = table.copy(ssign)
ssign45.mesh = "signs_sign45.obj"
minetest.register_node("signs:standing_sign45", ssign45)

local ssign67 = table.copy(ssign)
ssign67.mesh = "signs_sign67.5.obj"
minetest.register_node("signs:standing_sign67_5", ssign67)

minetest.register_entity("signs:text", {
	pointable = false,
	visual = "upright_sprite",
	textures = {},
	physical = false,
	collide_with_objects = false,

	_signnodename = nil, -- node name of sign node to which the text belongs

	on_activate = function(self, staticdata)
		if staticdata ~= nil and staticdata ~= "" then
			local des = minetest.deserialize(staticdata)
			if des then
				self._signnodename = des._signnodename
			end
		end
		local meta = minetest.get_meta(self.object:get_pos())
		local text = meta:get_string("text")
		self.object:set_properties({
			textures={generate_texture(create_lines(text), self._signnodename)},
		})
		self.object:set_armor_groups({ immortal = 1 })
	end,
	get_staticdata = function(self)
		local out = { _signnodename = self._signnodename }
		return minetest.serialize(out)
	end,
})

minetest.register_craft({
	type = "fuel",
	recipe = "signs:wall_sign",
	burntime = 10,
})

if minetest.get_modpath("default") then
	minetest.register_craft({
		output = 'signs:wall_sign 3',
		recipe = {
			{'group:wood', 'group:wood', 'group:wood'},
			{'group:wood', 'group:wood', 'group:wood'},
			{'', 'default:stick', ''},
		}
	})
end

minetest.register_alias("signs:sign_wall", "signs:wall_sign")
minetest.register_alias("signs:sign_yard", "signs:standing_sign")

minetest.register_lbm({
	name = "signs:respawn_entities",
	label = "Wiederherstellung von Text-Elementen",
	run_at_every_load = true,
	nodenames = { "signs:wall_sign", "signs:standing_sign", "signs:standing_sign22_5", "signs:standing_sign45", "signs:standing_sign67_5" },
	action = function(pos, node)
		update_sign(pos)
	end,
})