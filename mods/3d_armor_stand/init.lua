local elements = {"head", "torso", "legs", "feet"}

local function get_stand_object(pos)
	local object = nil
	local objects = minetest.get_objects_inside_radius(pos, 0.5) or {}
	for _, obj in pairs(objects) do
		local ent = obj:get_luaentity()
		if ent then
			if ent.name == "3d_armor_stand:armor_entity" then
				if object then
					obj:remove()
				else
					object = obj
				end
			end
		end
	end
	return object
end

local function update_entity(pos)
	local node = minetest.get_node(pos)
	local object = get_stand_object(pos)
	if object then
		if not string.find(node.name, "3d_armor_stand:") then
			object:remove()
			return
		end
	else
		object = minetest.add_entity(pos, "3d_armor_stand:armor_entity")
	end
	if object then
		local texture = "3d_armor_trans.png"
		local textures = {}
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local yaw = 0
		if inv then
			for _, element in pairs(elements) do
				local stack = inv:get_stack("armor_"..element, 1)
				if stack:get_count() == 1 then
					local item = stack:get_name() or ""
					local def = stack:get_definition() or {}
					local groups = def.groups or {}
					if groups["armor_"..element] then
						local texture = def.texture or item:gsub("%:", "_")
						table.insert(textures, texture..".png")
					end
				end
			end
		end
		if #textures > 0 then
			texture = table.concat(textures, "^")
		end
		if node.param2 then
			local rot = node.param2 % 4
			if rot == 1 then
				yaw = 3 * math.pi / 2
			elseif rot == 2 then
				yaw = math.pi
			elseif rot == 3 then
				yaw = math.pi / 2
			end
		end
		object:set_yaw(yaw)
		object:set_properties({textures={texture}})
	end
end

local drop_armor = function(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	for _, element in pairs(elements) do
		local stack = inv:get_stack("armor_"..element, 1)
		if not stack:is_empty() then
			local p = {x=pos.x+math.random(0, 10)/10-0.5, y=pos.y, z=pos.z+math.random(0, 10)/10-0.5}
			minetest.add_item(p, stack)
		end
	end
end

local on_rotate
if minetest.get_modpath("screwdriver") then
	on_rotate = screwdriver.disallow
end

minetest.register_node("3d_armor_stand:armor_stand", {
	description = "Kleiderpuppe",
	drawtype = "mesh",
	mesh = "3d_armor_stand.obj",
	inventory_image = "3d_armor_stand_item.png",
	wield_image = "3d_armor_stand_item.png",
	tiles = {"default_wood.png", "default_silver_block.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = false,
	is_ground_content = false,
	stack_max = 16,
	selection_box = {
		type = "fixed",
		fixed = {-0.5,-0.5,-0.5, 0.5,1.4,0.5}
	},
	groups = {choppy = 3, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_wood_defaults(),
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		for _, element in pairs(elements) do
			inv:set_size("armor_"..element, 1)
		end
	end,
	on_destruct = drop_armor,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local protname = clicker:get_player_name()
		if minetest.is_protected(pos, protname) then
			minetest.record_protection_violation(pos, protname)
			return itemstack
		end

		local inv = minetest.get_inventory({type = "node", pos = pos})
		if not inv then
			return itemstack
		end

		local name = itemstack:get_name()
		local list
		for e=1, #elements do
			local g = minetest.get_item_group(name, "armor_" .. elements[e])
			if g ~= nil and g ~= 0 then
				list = "armor_" .. elements[e]
				break
			end
		end
		local wielditem = clicker:get_wielded_item()
		if list then
			local single_item = ItemStack(itemstack)
			single_item:set_count(1)
			if inv:is_empty(list) then
				inv:add_item(list, single_item)
				update_entity(pos)
				itemstack:take_item()
				return itemstack
			end
		end

		for e=1, #elements do
			local stand_armor = inv:get_stack("armor_" .. elements[e], 1)
			if not stand_armor:is_empty() then
				local pinv = clicker:get_inventory()
				local taken = false
				if wielditem:get_name() == "" then
					pinv:set_stack("main", clicker:get_wield_index(), stand_armor)
					taken = true
				elseif (wielditem:get_name() == stand_armor:get_name() and wielditem:get_count() < wielditem:get_stack_max()) then
					wielditem:set_count(wielditem:get_count()+1)
					pinv:set_stack("main", clicker:get_wield_index(), wielditem)
					taken = true
				end
				if taken then
					stand_armor:take_item()
					inv:set_stack("armor_" .. elements[e], 1, stand_armor)
				end
				update_entity(pos)
				return clicker:get_wielded_item()
			end
		end
		update_entity(pos)
		return itemstack
	end,
	after_place_node = function(pos)
		minetest.add_entity(pos, "3d_armor_stand:armor_entity")
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		local name = player:get_player_name()
		if minetest.is_protected(pos, name) then
			minetest.record_protection_violation(pos, name)
			return 0
		else
			return stack:get_count()
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local name = player:get_player_name()
		if minetest.is_protected(pos, name) then
			minetest.record_protection_violation(pos, name)
			return 0
		end
		local def = stack:get_definition() or {}
		local groups = def.groups or {}
		if groups[listname] then
			return 1
		end
		return 0
	end,
	allow_metadata_inventory_move = function()
		return 0
	end,
	on_metadata_inventory_put = function(pos)
		update_entity(pos)
	end,
	on_metadata_inventory_take = function(pos)
		update_entity(pos)
	end,
	after_destruct = function(pos)
		update_entity(pos)
	end,
	on_blast = function(pos)
		local object = get_stand_object(pos)
		if object then
			object:remove()
		end
		minetest.after(1, function(pos)
			update_entity(pos)
		end, pos)
	end,
	on_rotate = on_rotate,
})

minetest.register_entity("3d_armor_stand:armor_entity", {
	physical = true,
	visual = "mesh",
	mesh = "3d_armor_entity.obj",
	visual_size = {x=1, y=1},
	collisionbox = {-0.1,-0.4,-0.1, 0.1,1.3,0.1},
	pointable = false,
	textures = {"3d_armor_trans.png"},
	pos = nil,
	timer = 0,
	on_activate = function(self)
		local pos = self.object:get_pos()
		self.object:set_armor_groups({immortal=1})
		if pos then
			self.pos = vector.round(pos)
			update_entity(pos)
		end
	end,
	on_step = function(self, dtime)
		if not self.pos then
			return
		end
		self.timer = self.timer + dtime
		if self.timer > 1 then
			self.timer = 0
			local pos = self.object:get_pos()
			if pos then
				if vector.equals(vector.round(pos), self.pos) then
					return
				end
			end
			update_entity(self.pos)
			self.object:remove()
		end
	end,
})

minetest.register_lbm({
	label = "Respawn armor stand entities",
	name = "3d_armor_stand:respawn_entities",
	nodenames = {"3d_armor_stand:armor_stand"},
	run_at_every_load = true,
	action = function(pos, node)
		update_entity(pos, node)
	end,
})

minetest.register_craft({
	output = "3d_armor_stand:armor_stand",
	recipe = {
		{"default:stick", "default:stick", "default:stick"},
		{"", "default:stick", ""},
		{"default:silver_ingot", "default:silver_ingot", "default:silver_ingot"},
	}
})

