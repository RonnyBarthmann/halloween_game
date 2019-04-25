doors = {}

local _doors = {}
_doors.registered_doors = {}
_doors.registered_trapdoors = {}

function doors.get(pos)
	local node_name = minetest.get_node(pos).name
	if _doors.registered_doors[node_name] then
		return {
			pos = pos,
			open = function(self, player)
				if self:state() then
					return false
				end
				return _doors.door_toggle(self.pos, nil, player)
			end,
			close = function(self, player)
				if not self:state() then
					return false
				end
				return _doors.door_toggle(self.pos, nil, player)
			end,
			toggle = function(self, player)
				return _doors.door_toggle(self.pos, nil, player)
			end,
			state = function(self)
				local state = minetest.get_meta(self.pos):get_int("state")
				return state %2 == 1
			end
		}
	elseif _doors.registered_trapdoors[node_name] then
		return {
			pos = pos,
			open = function(self, player)
				if self:state() then
					return false
				end
				return _doors.trapdoor_toggle(self.pos, nil, player)
			end,
			close = function(self, player)
				if not self:state() then
					return false
				end
				return _doors.trapdoor_toggle(self.pos, nil, player)
			end,
			toggle = function(self, player)
				return _doors.trapdoor_toggle(self.pos, nil, player)
			end,
			state = function(self)
				return minetest.get_node(self.pos).name:sub(-5) == "_open"
			end
		}
	else
		return nil
	end
end

minetest.register_node("doors:hidden", {
	description = "Verborgenes Tuersegment",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = true,
	pointable = false,
	diggable = false,
	buildable_to = false,
	floodable = false,
	stack_max = 64,
	drop = "",
	groups = {not_in_creative_inventory = 1},
	on_blast = function() end,
	tiles = {"doors_blank.png"},
	nodebox = {
		type = "fixed",
		fixed = {-15/32, 13/32, -15/32, -13/32, 1/2, -13/32},
	},
	collision_box = {
		type = "fixed",
		fixed = {-15/32, 13/32, -15/32, -13/32, 1/2, -13/32},
	},
})

local transform = {
	{
		{v = "_a", param2 = 3},
		{v = "_a", param2 = 0},
		{v = "_a", param2 = 1},
		{v = "_a", param2 = 2},
	},
	{
		{v = "_b", param2 = 1},
		{v = "_b", param2 = 2},
		{v = "_b", param2 = 3},
		{v = "_b", param2 = 0},
	},
	{
		{v = "_b", param2 = 1},
		{v = "_b", param2 = 2},
		{v = "_b", param2 = 3},
		{v = "_b", param2 = 0},
	},
	{
		{v = "_a", param2 = 3},
		{v = "_a", param2 = 0},
		{v = "_a", param2 = 1},
		{v = "_a", param2 = 2},
	},
}

function _doors.door_toggle(pos, node, clicker)
	local meta = minetest.get_meta(pos)
	node = node or minetest.get_node(pos)
	local def = minetest.registered_nodes[node.name]
	local name = def.door.name

	local state = meta:get_string("state")
	if state == "" then
		if node.name:sub(-2) == "_b" then
			state = 2
		else
			state = 0
		end
	else
		state = tonumber(state)
	end

	if clicker and not minetest.check_player_privs(clicker, "protection_bypass") then
		local item = clicker:get_wielded_item()
		local owner = meta:get_string("doors_owner")
		if item:get_name() == "default:key" then
			local key_meta = minetest.parse_json(item:get_metadata())
			local secret = meta:get_string("key_lock_secret")
			if secret ~= key_meta.secret then
				return false
			end

		elseif owner ~= "" then
			if clicker:get_player_name() ~= owner then
				return false
			end
		end
	end

	if state % 2 == 1 then
		state = state - 1
	else
		state = state + 1
	end

	local dir = node.param2
	if state % 2 == 0 then
		minetest.sound_play(def.door.sounds[1],
			{pos = pos, gain = 0.3, max_hear_distance = 10})
	else
		minetest.sound_play(def.door.sounds[2],
			{pos = pos, gain = 0.3, max_hear_distance = 10})
	end

	minetest.swap_node(pos, {
		name = name .. transform[state + 1][dir+1].v,
		param2 = transform[state + 1][dir+1].param2
	})
	meta:set_int("state", state)

	return true
end

local function on_place_node(place_to, newnode,
	placer, oldnode, itemstack, pointed_thing)
	for _, callback in ipairs(minetest.registered_on_placenodes) do
		-- Deepcopy pos, node and pointed_thing because callback can modify them
		local place_to_copy = {x = place_to.x, y = place_to.y, z = place_to.z}
		local newnode_copy =
			{name = newnode.name, param1 = newnode.param1, param2 = newnode.param2}
		local oldnode_copy =
			{name = oldnode.name, param1 = oldnode.param1, param2 = oldnode.param2}
		local pointed_thing_copy = {
			type  = pointed_thing.type,
			above = vector.new(pointed_thing.above),
			under = vector.new(pointed_thing.under),
			ref   = pointed_thing.ref,
		}
		callback(place_to_copy, newnode_copy, placer,
			oldnode_copy, itemstack, pointed_thing_copy)
	end
end

local function can_dig_door(pos, digger)
	local digger_name = digger and digger:get_player_name()
	if digger_name and minetest.get_player_privs(digger_name).protection_bypass then
		return true
	end
	return minetest.get_meta(pos):get_string("doors_owner") == digger_name
end

function doors.register(name, def)
	if not name:find(":") then
		name = "doors:" .. name
	end

	minetest.register_lbm({
		name = ":doors:replace_" .. name:gsub(":", "_"),
		nodenames = {name.."_b_1", name.."_b_2"},
		action = function(pos, node)
			local l = tonumber(node.name:sub(-1))
			local meta = minetest.get_meta(pos)
			local h = meta:get_int("right") + 1
			local p2 = node.param2
			local replace = {
				{{type = "a", state = 0}, {type = "a", state = 3}},
				{{type = "b", state = 1}, {type = "b", state = 2}}
			}
			local new = replace[l][h]
			minetest.swap_node(pos, {name = name .. "_" .. new.type, param2 = p2})
			meta:set_int("state", new.state)
			local p3 = p2
			if new.state >= 2 then
				p3 = (p3 + 3) % 4
			end
			if new.state % 2 == 1 then
				if new.state >= 2 then
					p3 = (p3 + 1) % 4
				else
					p3 = (p3 + 3) % 4
				end
			end
			minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},
				{name = "doors:hidden", param2 = p3})
		end
	})

	minetest.register_craftitem(":" .. name, {
		description = def.description,
		inventory_image = def.inventory_image,
		stack_max = 64,
		on_place = function(itemstack, placer, pointed_thing)
			local pos

			if not pointed_thing.type == "node" then
				return itemstack
			end

			local node = minetest.get_node(pointed_thing.under)
			local pdef = minetest.registered_nodes[node.name]
			if pdef and pdef.on_rightclick then
				return pdef.on_rightclick(pointed_thing.under,
						node, placer, itemstack, pointed_thing)
			end

			if pdef and pdef.buildable_to then
				pos = pointed_thing.under
			else
				pos = pointed_thing.above
				node = minetest.get_node(pos)
				pdef = minetest.registered_nodes[node.name]
				if not pdef or not pdef.buildable_to then
					return itemstack
				end
			end

			local above = {x = pos.x, y = pos.y + 1, z = pos.z}
			local top_node = minetest.get_node_or_nil(above)
			local topdef = top_node and minetest.registered_nodes[top_node.name]

			if not topdef or not topdef.buildable_to then
				return itemstack
			end

			local pn = placer:get_player_name()
			if minetest.is_protected(pos, pn) or minetest.is_protected(above, pn) then
				return itemstack
			end

			local dir = minetest.dir_to_facedir(placer:get_look_dir())

			local ref = {
				{x = -1, y = 0, z = 0},
				{x = 0, y = 0, z = 1},
				{x = 1, y = 0, z = 0},
				{x = 0, y = 0, z = -1},
			}

			local aside = {
				x = pos.x + ref[dir + 1].x,
				y = pos.y + ref[dir + 1].y,
				z = pos.z + ref[dir + 1].z,
			}

			local state = 0
			if minetest.get_item_group(minetest.get_node(aside).name, "door") == 1 then
				state = state + 2
				minetest.set_node(pos, {name = name .. "_b", param2 = dir})
				minetest.set_node(above, {name = "doors:hidden", param2 = (dir + 3) % 4})
			else
				minetest.set_node(pos, {name = name .. "_a", param2 = dir})
				minetest.set_node(above, {name = "doors:hidden", param2 = dir})
			end

			local meta = minetest.get_meta(pos)
			meta:set_int("state", state)

			if def.protected then
				meta:set_string("doors_owner", pn)
				meta:set_string("infotext", "von " .. pn)
			end

			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end

			on_place_node(pos, minetest.get_node(pos),
				placer, node, itemstack, pointed_thing)

			return itemstack
		end
	})
	def.inventory_image = nil

	if def.recipe then
		minetest.register_craft({
			output = name,
			recipe = def.recipe,
		})
	end
	def.recipe = nil

	if not def.sounds then
		def.sounds = default.node_sound_wood_defaults()
	end

	if not def.sound_open then
		def.sound_open = "doors_door_open"
	end

	if not def.sound_close then
		def.sound_close = "doors_door_close"
	end

	def.groups.not_in_creative_inventory = 1
	def.groups.door = 1
	def.drop = name
	def.door = {
		name = name,
		sounds = { def.sound_close, def.sound_open },
	}

	def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		_doors.door_toggle(pos, node, clicker)
		return itemstack
	end
	def.after_dig_node = function(pos, node, meta, digger)
		minetest.remove_node({x = pos.x, y = pos.y + 1, z = pos.z})
		minetest.check_for_falling({x = pos.x, y = pos.y + 1, z = pos.z})
	end
	def.on_rotate = false

	if def.protected then
		def.can_dig = can_dig_door
		def.on_blast = function() end
		def.on_key_use = function(pos, player)
			local door = doors.get(pos)
			door:toggle(player)
		end
		def.on_skeleton_key_use = function(pos, player, newsecret)
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("doors_owner")
			local pname = player:get_player_name()

			if owner ~= pname then
				minetest.record_protection_violation(pos, pname)
				minetest.chat_send_player(pname, "Das ist nicht deine verschlossene Tuer.")
				return nil
			end

			local secret = meta:get_string("key_lock_secret")
			if secret == "" then
				secret = newsecret
				meta:set_string("key_lock_secret", secret)
			end

			return secret, "Eine verschlossene Tuer", owner
		end
	else
		def.on_blast = function(pos, intensity)
			minetest.remove_node(pos)
			minetest.remove_node({x = pos.x, y = pos.y + 1, z = pos.z})
			return {name}
		end
	end

	def.on_destruct = function(pos)
		minetest.remove_node({x = pos.x, y = pos.y + 1, z = pos.z})
	end

	def.drawtype = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.sunlight_propagates = true
	def.use_texture_alpha = true
	def.stack_max = 64
	def.walkable = true
	def.is_ground_content = false
	def.buildable_to = false
	def.selection_box = {type = "fixed", fixed = {-1/2,-1/2,-1/2,1/2,3/2,-6/16}}
	def.collision_box = {type = "fixed", fixed = {-1/2,-1/2,-1/2,1/2,3/2,-6/16}}

	def.mesh = "door_a.obj"
	minetest.register_node(":" .. name .. "_a", def)

	def.mesh = "door_b.obj"
	minetest.register_node(":" .. name .. "_b", def)

	_doors.registered_doors[name .. "_a"] = true
	_doors.registered_doors[name .. "_b"] = true
end

doors.register("door_wood", {
		tiles = {{ name = "doors_door_wood.png", backface_culling = true }},
		description = "Holztuer",
		inventory_image = "doors_item_wood.png",
		stack_max = 64,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		recipe = {
			{"default:wood", "default:wood"},
			{"default:wood", "default:wood"},
			{"default:wood", "default:wood"},
		}
})

doors.register("door_jungle_wood", {
		tiles = {{ name = "doors_door_jungle_wood.png", backface_culling = true }},
		description = "Tropenholztuer",
		inventory_image = "doors_item_jungle_wood.png",
		stack_max = 64,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		recipe = {
			{"default:junglewood", "default:junglewood"},
			{"default:junglewood", "default:junglewood"},
			{"default:junglewood", "default:junglewood"},
		}
})

doors.register("door_pine_wood", {
		tiles = {{ name = "doors_door_pine_wood.png", backface_culling = true }},
		description = "Fichtenholztuer",
		inventory_image = "doors_item_pine_wood.png",
		stack_max = 64,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		recipe = {
			{"default:pine_wood", "default:pine_wood"},
			{"default:pine_wood", "default:pine_wood"},
			{"default:pine_wood", "default:pine_wood"},
		}
})

doors.register("door_aspen_wood", {
		tiles = {{ name = "doors_door_aspen_wood.png", backface_culling = true }},
		description = "Birkenholztuer",
		inventory_image = "doors_item_aspen_wood.png",
		stack_max = 64,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		recipe = {
			{"default:aspen_wood", "default:aspen_wood"},
			{"default:aspen_wood", "default:aspen_wood"},
			{"default:aspen_wood", "default:aspen_wood"},
		}
})

doors.register("door_acacia_wood", {
		tiles = {{ name = "doors_door_acacia_wood.png", backface_culling = true }},
		description = "Akazienholztuer",
		inventory_image = "doors_item_acacia_wood.png",
		stack_max = 64,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		recipe = {
			{"default:acacia_wood", "default:acacia_wood"},
			{"default:acacia_wood", "default:acacia_wood"},
			{"default:acacia_wood", "default:acacia_wood"},
		}
})

doors.register("door_steel", {
		tiles = {{name = "doors_door_steel.png", backface_culling = true}},
		description = "Stahltuer",
		inventory_image = "doors_item_steel.png",
		protected = true,
		stack_max = 64,
		groups = {cracky = 1},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		recipe = {
			{"default:steel_ingot", "default:steel_ingot"},
			{"default:steel_ingot", "default:steel_ingot"},
			{"default:steel_ingot", "default:steel_ingot"},
		}
})

doors.register("door_iron", {
		tiles = {{name = "doors_door_iron.png", backface_culling = true}},
		description = "Eisentuer",
		inventory_image = "doors_item_iron.png",
		protected = true,
		stack_max = 64,
		groups = {cracky = 2},
		sounds = default.node_sound_metal_defaults(),
		sound_open = "doors_steel_door_open",
		sound_close = "doors_steel_door_close",
		recipe = {
			{"default:iron_ingot", "default:iron_ingot"},
			{"default:iron_ingot", "default:iron_ingot"},
			{"default:iron_ingot", "default:iron_ingot"},
		}
})

function doors.register_door(name, def)
	if def.only_placer_can_open then
		def.protected = true
	end
	def.only_placer_can_open = nil

	local i = name:find(":")
	local modname = name:sub(1, i - 1)
	if not def.tiles then
		if def.protected then
			def.tiles = {{name = "doors_door_steel.png", backface_culling = true}}
		else
			def.tiles = {{name = "doors_door_wood.png", backface_culling = true}}
		end
	end

	doors.register(name, def)
end

function _doors.trapdoor_toggle(pos, node, clicker)
	node = node or minetest.get_node(pos)
	if clicker and not minetest.check_player_privs(clicker, "protection_bypass") then
		local item = clicker:get_wielded_item()
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("doors_owner")
		if item:get_name() == "default:key" then
			local key_meta = minetest.parse_json(item:get_metadata())
			local secret = meta:get_string("key_lock_secret")
			if secret ~= key_meta.secret then
				return false
			end

		elseif owner ~= "" then
			if clicker:get_player_name() ~= owner then
				return false
			end
		end
	end

	local def = minetest.registered_nodes[node.name]

	if string.sub(node.name, -5) == "_open" then
		minetest.sound_play(def.sound_close,
			{pos = pos, gain = 0.3, max_hear_distance = 10})
		minetest.swap_node(pos, {name = string.sub(node.name, 1,
			string.len(node.name) - 5), param1 = node.param1, param2 = node.param2})
	else
		minetest.sound_play(def.sound_open,
			{pos = pos, gain = 0.3, max_hear_distance = 10})
		minetest.swap_node(pos, {name = node.name .. "_open",
			param1 = node.param1, param2 = node.param2})
	end
end

function doors.register_trapdoor(name, def)
	if not name:find(":") then
		name = "doors:" .. name
	end

	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		_doors.trapdoor_toggle(pos, node, clicker)
		return itemstack
	end

	def.drawtype = "nodebox"
	def.stack_max = 64
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false

	if def.protected then
		def.can_dig = can_dig_door
		def.after_place_node = function(pos, placer, itemstack, pointed_thing)
			local pn = placer:get_player_name()
			local meta = minetest.get_meta(pos)
			meta:set_string("doors_owner", pn)
			meta:set_string("infotext", "von "..pn)

			return minetest.setting_getbool("creative_mode")
		end

		def.on_blast = function() end
		def.on_key_use = function(pos, player)
			local door = doors.get(pos)
			door:toggle(player)
		end
		def.on_skeleton_key_use = function(pos, player, newsecret)
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("doors_owner")
			local pname = player:get_player_name()

			if owner ~= pname then
				minetest.record_protection_violation(pos, pname)
				minetest.chat_send_player(pname, "Das ist nicht deine Falltuer.")
				return nil
			end

			local secret = meta:get_string("key_lock_secret")
			if secret == "" then
				secret = newsecret
				meta:set_string("key_lock_secret", secret)
			end

			return secret, "Eine verschlossene Falltuer.", owner
		end
	else
		def.on_blast = function(pos, intensity)
			minetest.remove_node(pos)
			return {name}
		end
	end

	if not def.sounds then
		def.sounds = default.node_sound_wood_defaults()
	end

	if not def.sound_open then
		def.sound_open = "doors_door_open"
	end

	if not def.sound_close then
		def.sound_close = "doors_door_close"
	end

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_closed.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -6/16, 0.5}
	}
	def_closed.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -6/16, 0.5}
	}
	def_closed.tiles = {def.tile_front,
			def.tile_front .. '^[transformFY',
			def.tile_side, def.tile_side,
			def.tile_side, def.tile_side}

	def_opened.node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 6/16, 0.5, 0.5, 0.5}
	}
	def_opened.selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, 6/16, 0.5, 0.5, 0.5}
	}
	def_opened.tiles = {def.tile_side, def.tile_side,
			def.tile_side .. '^[transform3',
			def.tile_side .. '^[transform1',
			def.tile_front .. '^[transform46',
			def.tile_front .. '^[transform6'}

	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)

	_doors.registered_trapdoors[name_opened] = true
	_doors.registered_trapdoors[name_closed] = true
end

doors.register_trapdoor("doors:trapdoor", {
	description = "Holzfalltuer",
	inventory_image = "doors_trapdoor.png",
	wield_image = "doors_trapdoor.png",
	stack_max = 64,
	tile_front = "doors_trapdoor.png",
	tile_side = "doors_trapdoor_side.png",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, door = 1},
})

doors.register_trapdoor("doors:trapdoor_iron", {
	description = "Eisenfalltuer",
	inventory_image = "doors_trapdoor_iron.png",
	wield_image = "doors_trapdoor_iron.png",
	tile_front = "doors_trapdoor_iron.png",
	tile_side = "doors_trapdoor_iron_side.png",
	stack_max = 64,
	protected = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = {cracky = 2, door = 1},
})

doors.register_trapdoor("doors:trapdoor_steel", {
	description = "Stahlfalltuer",
	inventory_image = "doors_trapdoor_steel.png",
	wield_image = "doors_trapdoor_steel.png",
	tile_front = "doors_trapdoor_steel.png",
	tile_side = "doors_trapdoor_steel_side.png",
	stack_max = 64,
	protected = true,
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	groups = {cracky = 1, door = 1},
})

minetest.register_craft({
	output = 'doors:trapdoor 3',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'doors:trapdoor_iron 6',
	recipe = {
		{'default:iron_ingot', 'default:iron_ingot', 'default:iron_ingot'},
		{'default:iron_ingot', 'default:iron_ingot', 'default:iron_ingot'},
	}
})

minetest.register_craft({
	output = 'doors:trapdoor_steel 6',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})

function doors.register_fencegate(name, def)

	minetest.register_craft({
		output = name .. "_closed",
		recipe = {
			{"default:stick", def.material, "default:stick"},
			{"default:stick", def.material, "default:stick"}
		}
	})

	local gate_texture = "doors_gate_overlay.png^" .. def.texture .. "^doors_gate_overlay.png^[makealpha:255,126,126"

	local fence = {
		description = def.description,
		drawtype = "nodebox",
		tiles = {def.texture},
		inventory_image = gate_texture,
		wield_image = gate_texture,
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		drop = name .. "_closed",
		stack_max = 64,
		connect_sides = {"left", "right"},
		groups = def.groups,
		sounds = def.sounds,
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			local node_def = minetest.registered_nodes[node.name]
			minetest.swap_node(pos, {name = node_def.gate, param2 = node.param2})
			minetest.sound_play(node_def.sound, {pos = pos, gain = 0.3,
				max_hear_distance = 8})
			return itemstack
		end,
	}

	if not fence.sounds then
		fence.sounds = default.node_sound_wood_defaults()
	end

	fence.groups.fence = 1

	local fence_closed = table.copy(fence)
	fence_closed.node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.375, -0.0625, -0.375, 0.375, 0.0625},
			{0.375, -0.375, -0.0625, 0.5, 0.375, 0.0625},
			{-0.375, 0.25, -0.0625, 0, 0.375, 0.0625},
			{0, 0.25, -0.0625, 0.375, 0.375, 0.0625},
			{0, -0.375, -0.0625, 0.375, -0.25, 0.0625},
			{-0.375, -0.375, -0.0625, 0, -0.25, 0.0625},
			{-0.125, -0.25, -0.0625, 0, 0.25, 0.0625},
			{0, -0.25, -0.0625, 0.125, 0.25, 0.0625},
		}
	}
	fence_closed.selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.375, -0.0625, 0, 0.375, 0.0625},
			{0, -0.375, -0.0625, 0.5, 0.375, 0.0625},
		}
	}
	fence_closed.gate = name .. "_open"
	fence_closed.sound = "doors_fencegate_open"
	local fence_open = table.copy(fence)
	fence_open.gate = name .. "_closed"
	fence_open.sound = "doors_fencegate_close"
	fence_open.groups.not_in_creative_inventory = 1
	fence_open.node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.375, -0.0625, -0.375, 0.375, 0.0625},
			{0.375, -0.375, -0.0625, 0.5, 0.375, 0.0625},
			{-0.5, 0.25, 0.0625, -0.375, 0.375, 0.4375},
			{0.375, 0.25, 0.0625, 0.5, 0.375, 0.4375},
			{0.375, -0.375, 0.0625, 0.5, -0.25, 0.4375},
			{-0.5, -0.375, 0.0625, -0.375, -0.25, 0.4375},
			{-0.5, -0.25, 0.3125, -0.375, 0.25, 0.4375},
			{0.375, -0.25, 0.3125, 0.5, 0.25, 0.4375},
		}
	}
	fence_open.selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.375, -0.0625, -0.375, 0.375, 0.4375},
			{0.375, -0.375, -0.0625, 0.5, 0.375, 0.4375},
		}
	}
	minetest.register_node(":" .. name .. "_closed", fence_closed)
	minetest.register_node(":" .. name .. "_open", fence_open)
end

doors.register_fencegate("doors:gate_frost_wood", {
	description = "Gefrohrenes Holzzauntor",
	texture = "default_frost_wood.png",
	material = "default:frost_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, fence_connect = 1}
})

doors.register_fencegate("doors:gate_wood", {
	description = "Holzzauntor",
	texture = "default_wood.png",
	material = "default:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, fence_connect = 1, flammable = 2}
})

doors.register_fencegate("doors:gate_acacia_wood", {
	description = "Akazienholzzauntor",
	texture = "default_acacia_wood.png",
	material = "default:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, fence_connect = 1, flammable = 2}
})

doors.register_fencegate("doors:gate_jungle_wood", {
	description = "Tropenholzzauntor",
	texture = "default_junglewood.png",
	material = "default:junglewood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, fence_connect = 1, flammable = 2}
})

doors.register_fencegate("doors:gate_pine_wood", {
	description = "Fichtenholzzauntor",
	texture = "default_pine_wood.png",
	material = "default:pine_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, fence_connect = 1, flammable = 2}
})

doors.register_fencegate("doors:gate_aspen_wood", {
	description = "Birkenholzzauntor",
	texture = "default_aspen_wood.png",
	material = "default:aspen_wood",
	groups = {choppy = 3, oddly_breakable_by_hand = 2, fence_connect = 1, flammable = 2}
})

doors.register_fencegate("doors:gate_coal_wood", {
	description = "Verbranntes Holztor",
	texture = "default_coal_wood.png",
	material = "default:coal_wood",
	groups = {cracky = 3, oddly_breakable_by_hand = 2, fence_connect = 1}
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:trapdoor",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_coal_wood",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_wood",
	burntime = 12,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_jungle_wood",
	burntime = 14,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_pine_wood",
	burntime = 11,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_acacia_wood",
	burntime = 13,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:door_aspen_wood",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_wood_closed",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_acacia_wood_closed",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_junglewood_closed",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_pine_wood_closed",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "doors:gate_aspen_wood_closed",
	burntime = 10,
})