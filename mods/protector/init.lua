protector = {}
protector.mod = "redo"
protector.radius = tonumber(minetest.settings:get("protector_radius")) or 16
protector.flip = minetest.settings:get_bool("protector_flip") or false
protector.hurt = tonumber(minetest.settings:get("protector_hurt")) or 0
protector.spawn = tonumber(minetest.settings:get("protector_spawn")
	or minetest.settings:get("protector_pvp_spawn")) or 0

local statspawn = minetest.string_to_pos(minetest.settings:get("static_spawnpoint"))
		or {x = 0, y = 2, z = 0}

local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s, a, ...) a = {a, ...}
		return s:gsub("@(%d+)", function(n)
			return a[tonumber(n)]
		end)
	end

end
protector.intllib = S

local get_member_list = function(meta)

	return meta:get_string("members"):split(" ")
end

local set_member_list = function(meta, list)

	meta:set_string("members", table.concat(list, " "))
end

local is_owner = function(meta, name)

	return name == meta:get_string("owner")
end

local is_member = function (meta, name)

	for _, n in pairs(get_member_list(meta)) do

		if n == name then
			return true
		end
	end

	return false
end

local add_member = function(meta, name)

	if is_owner(meta, name)
	or is_member(meta, name) then
		return
	end

	local list = get_member_list(meta)

	table.insert(list, name)

	set_member_list(meta, list)
end

local del_member = function(meta, name)

	local list = get_member_list(meta)

	for i, n in pairs(list) do

		if n == name then
			table.remove(list, i)
			break
		end
	end

	set_member_list(meta, list)
end

local protector_formspec = function(meta)

	local formspec = "size[8,7]"
		.. default.gui_bg
		.. default.gui_bg_img
		.. default.gui_slots
		.. "label[2.5,0;" .. S("-- Protector interface --") .. "]"
		.. "label[0,1;" .. S("SCHLAG block um geschuezten Bereich anzuzeigen.") .. "]"
		.. "label[0,2;" .. S("Freunde:") .. "]"
		.. "button_exit[2.5,6.2;3,0.5;close_me;" .. S("Schliessen") .. "]"

	local members = get_member_list(meta)
	local npp = 12 -- max users added to protector list
	local i = 0

	for n = 1, #members do

		if i < npp then

			-- show username
			formspec = formspec .. "button[" .. (i % 4 * 2)
			.. "," .. math.floor(i / 4 + 3)
			.. ";1.5,.5;protector_member;" .. members[n] .. "]"

			-- username remove button
			.. "button[" .. (i % 4 * 2 + 1.25) .. ","
			.. math.floor(i / 4 + 3)
			.. ";.75,.5;protector_del_member_" .. members[n] .. ";X]"
		end

		i = i + 1
	end
	
	if i < npp then

		-- user name entry field
		formspec = formspec .. "field[" .. (i % 4 * 2 + 1 / 3) .. ","
		.. (math.floor(i / 4 + 3) + 1 / 3)
		.. ";1.433,.5;protector_add_member;;]"

		-- username add button
		.."button[" .. (i % 4 * 2 + 1.25) .. ","
		.. math.floor(i / 4 + 3) .. ";.75,.5;protector_submit;+]"

	end

	return formspec
end

local inside_spawn = function(pos, radius)

	if protector.spawn <= 0 then
		return false
	end

	if pos.x < statspawn.x + radius
	and pos.x > statspawn.x - radius
	and pos.y < statspawn.y + radius
	and pos.y > statspawn.y - radius
	and pos.z < statspawn.z + radius
	and pos.z > statspawn.z - radius then

		return true
	end

	return false
end

protector.can_dig = function(r, pos, digger, onlyowner, infolevel)

	if not digger or not pos then
		return false
	end

	if infolevel == 1
	and minetest.check_player_privs(digger, {protection_bypass = true}) then
		return true
	end

	if infolevel == 3 then infolevel = 1 end

	if inside_spawn(pos, protector.spawn) then

		minetest.chat_send_player(digger,
			S("Spawn @1 has been protected up to a @2 block radius.",
				minetest.pos_to_string(statspawn), protector.spawn))

		return false
	end

	local pos = minetest.find_nodes_in_area(
		{x = pos.x - r, y = pos.y - r, z = pos.z - r},
		{x = pos.x + r, y = pos.y + r, z = pos.z + r},
		{"protector:protect"})

	local meta, owner, members

	for n = 1, #pos do

		meta = minetest.get_meta(pos[n])
		owner = meta:get_string("owner") or ""
		members = meta:get_string("members") or ""

		if infolevel == 1 and owner ~= digger then

			if onlyowner or not is_member(meta, digger) then

				minetest.chat_send_player(digger,
					S("Dieser Bereich gehoert @1!", owner))

					return false
			end
		end

		if infolevel == 2 then

			minetest.chat_send_player(digger, S("Dieser Bereich gehoert @1.", owner))

			minetest.chat_send_player(digger,
				S("Schutzbereich bei: @1", minetest.pos_to_string(pos[n])))

			if members ~= "" then

				minetest.chat_send_player(digger, S("Freunde: @1.", members))
			end

			return false
		end

	end

	if infolevel == 2 then

		if #pos < 1 then

			minetest.chat_send_player(digger, S("Dieser bereich ist geschuetzt."))
		end

		minetest.chat_send_player(digger, S("Hier kannst du Bauen."))
	end

	return true
end


local old_is_protected = minetest.is_protected

function minetest.is_protected(pos, digger)

	digger = digger or "" -- nil check

	if not protector.can_dig(protector.radius, pos, digger, false, 1) then

		local player = minetest.get_player_by_name(digger)

		if player and player:is_player() then

			-- hurt player if protection violated
			if protector.hurt > 0 and player:get_hp() > 0 then
				player:set_hp(player:get_hp() - protector.hurt)
			end

			-- flip player when protection violated
			if protector.flip then
				-- yaw + 180Â°
				local yaw = player:get_look_horizontal() + math.pi
				--local yaw = player:get_look_yaw() + math.pi

				if yaw > 2 * math.pi then
					yaw = yaw - 2 * math.pi
				end

				--player:set_look_horizontal(yaw)
				player:set_look_yaw(yaw)

				-- invert pitch
				player:set_look_vertical(-player:get_look_vertical())
				--player:set_look_pitch(-player:get_look_pitch())

				-- if digging below player, move up to avoid falling through hole
				local pla_pos = player:get_pos()

				if pos.y < pla_pos.y then

					player:setpos({
						x = pla_pos.x,
						y = pla_pos.y + 0.8,
						z = pla_pos.z
					})
				end
			end
		end

		return true
	end

	-- otherwise can dig or place
	return old_is_protected(pos, digger)
end


-- make sure protection block doesn't overlap another protector's area
local check_overlap = function(itemstack, placer, pointed_thing)

	if pointed_thing.type ~= "node" then
		return itemstack
	end

	local pos = pointed_thing.above
	local name = placer:get_player_name()

	-- make sure protector doesn't overlap onto protected spawn area
	if inside_spawn(pos, protector.spawn + protector.radius) then

		minetest.chat_send_player(name,
			S("Spawn @1 has been protected up to a @2 block radius.",
			minetest.pos_to_string(statspawn), protector.spawn))

		return itemstack
	end

	-- make sure protector doesn't overlap any other player's area
	if not protector.can_dig(protector.radius * 2, pos, name, true, 3) then

		minetest.chat_send_player(name,
			S("Overlaps into above players protected area"))

		return itemstack
	end

	return minetest.item_place(itemstack, placer, pointed_thing)

end


-- protection node
minetest.register_node("protector:protect", {
	description = S("Schutzstein"),
	drawtype = "nodebox",
	tiles = {
		"default_runestone.png",
		"default_runestone.png",
		"default_runestone.png^protector_logo.png"
	},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 2, unbreakable = 1, fence_connect = 1},
	is_ground_content = false,
	paramtype = "light",
	light_source = 4,

	node_box = {
		type = "fixed",
		fixed = {
			{-0.5 ,-0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
	stack_max = 64,

	on_place = check_overlap,

	after_place_node = function(pos, placer)

		local meta = minetest.get_meta(pos)

		meta:set_string("owner", placer:get_player_name() or "")
		meta:set_string("infotext", S("Schutzbereich (von @1)", meta:get_string("owner")))
		meta:set_string("members", "")
	end,

	on_use = function(itemstack, user, pointed_thing)

		if pointed_thing.type ~= "node" then
			return
		end

		protector.can_dig(protector.radius, pointed_thing.under, user:get_player_name(), false, 2)
	end,

	on_rightclick = function(pos, node, clicker, itemstack)

		local meta = minetest.get_meta(pos)

		if meta
		and protector.can_dig(1, pos, clicker:get_player_name(), true, 1) then

			minetest.show_formspec(clicker:get_player_name(),
				"protector:node_" .. minetest.pos_to_string(pos),
				protector_formspec(meta))
		end
	end,

	on_punch = function(pos, node, puncher)

		if minetest.is_protected(pos, puncher:get_player_name()) then
			return
		end

		minetest.add_entity(pos, "protector:display")
	end,

	can_dig = function(pos, player)

		return player and protector.can_dig(1, pos, player:get_player_name(), true, 1)
	end,

	on_blast = function() end,
})

minetest.register_craft({
	output = "protector:protect",
	recipe = {
		{"default:stone", "default:stone", "default:stone"},
		{"default:stone", "mobs:ender_eye", "default:stone"},
		{"default:stone", "default:stone", "default:stone"},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "protector:protect",
	recipe = {"default:runestone", "mobs:ender_eye"}
})

minetest.register_on_player_receive_fields(function(player, formname, fields)

	if string.sub(formname, 0, string.len("protector:node_")) == "protector:node_" then

		local pos_s = string.sub(formname, string.len("protector:node_") + 1)
		local pos = minetest.string_to_pos(pos_s)
		local meta = minetest.get_meta(pos)

		-- only owner can add names
		if not protector.can_dig(1, pos, player:get_player_name(), true, 1) then
			return
		end

		-- add member [+]
		if fields.protector_add_member then

			for _, i in pairs(fields.protector_add_member:split(" ")) do
				add_member(meta, i)
			end
		end

		-- remove member [x]
		for field, value in pairs(fields) do

			if string.sub(field, 0,
				string.len("protector_del_member_")) == "protector_del_member_" then

				del_member(meta,
					string.sub(field,string.len("protector_del_member_") + 1))
			end
		end

		-- reset formspec until close button pressed
		if not fields.close_me then
			minetest.show_formspec(player:get_player_name(), formname, protector_formspec(meta))
		end
	end
end)

minetest.register_entity("protector:display", {
	physical = false,
	collisionbox = {0, 0, 0, 0, 0, 0},
	visual = "wielditem",
	-- wielditem seems to be scaled to 1.5 times original node size
	visual_size = {x = 1.0 / 1.5, y = 1.0 / 1.5},
	textures = {"protector:display_node"},
	timer = 0,

	on_step = function(self, dtime)

		self.timer = self.timer + dtime

		-- remove after 5 seconds
		if self.timer > 5 then
			self.object:remove()
		end
	end,
})

local x = protector.radius
minetest.register_node("protector:display_node", {
	tiles = {"protector_display.png"},
	use_texture_alpha = true,
	walkable = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			-- sides
			{-(x+.55), -(x+.55), -(x+.55), -(x+.45), (x+.55), (x+.55)},
			{-(x+.55), -(x+.55), (x+.45), (x+.55), (x+.55), (x+.55)},
			{(x+.45), -(x+.55), -(x+.55), (x+.55), (x+.55), (x+.55)},
			{-(x+.55), -(x+.55), -(x+.55), (x+.55), (x+.55), -(x+.45)},
			-- top
			{-(x+.55), (x+.45), -(x+.55), (x+.55), (x+.55), (x+.55)},
			-- bottom
			{-(x+.55), -(x+.55), -(x+.55), (x+.55), -(x+.45), (x+.55)},
			-- middle (surround protector)
			{-.55,-.55,-.55, .55,.55,.55},
		},
	},
	selection_box = {
		type = "regular",
	},
	paramtype = "light",
	groups = {dig_immediate = 3, not_in_creative_inventory = 1},
	drop = "",
})


local path = minetest.get_modpath("protector")

dofile(path .. "/admin.lua")
dofile(path .. "/hud.lua")
dofile(path .. "/lucky_block.lua")
