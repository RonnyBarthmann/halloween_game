local function is_water(pos)
	local nn = minetest.get_node(pos).name
	return minetest.get_item_group(nn, "water") ~= 0
end


local function get_sign(i)
	if i == 0 then
		return 0
	else
		return i / math.abs(i)
	end
end


local function get_velocity(v, yaw, y)
	local x = -math.sin(yaw) * v
	local z =  math.cos(yaw) * v
	return {x = x, y = y, z = z}
end


local function get_v(v)
	return math.sqrt(v.x ^ 2 + v.z ^ 2)
end

local boat_visual_size = {x = 3, y = 3}
local driver_visual_size = { x = 1/boat_visual_size.x, y = 1/boat_visual_size.y }
local paddling_speed = 22
local boat_y_offset = 0.35

local boat = {
	physical = true,
	collisionbox = {-0.5, -0.35, -0.5, 0.5, 0.3, 0.5},
	visual = "mesh",
	mesh = "boats_boat.b3d",
	textures = {"boats_texture_boat.png"},
	visual_size = boat_visual_size,

	_driver = nil,
	_v = 0,
	_last_v = 0,
	_removed = false,
	_itemstring = "boats:boat",
	_animation = 0,
}

function boat.on_rightclick(self, clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	local name = clicker:get_player_name()
	if self._driver and clicker == self._driver then
		self._driver = nil
		clicker:set_detach()
		clicker:set_properties({visual_size = {x=1, y=1}})
		default.player_attached[name] = false
		default.player_set_animation(clicker, "stand" , 30)
		local pos = clicker:getpos()
		pos = {x = pos.x, y = pos.y + 0.2, z = pos.z}
		clicker:setpos(pos)
	elseif not self._driver then
		local attach = clicker:get_attach()
		if attach and attach:get_luaentity() then
			local luaentity = attach:get_luaentity()
			if luaentity._driver then
				luaentity._driver = nil
			end
			clicker:set_detach()
			clicker:set_properties({visual_size = {x=1, y=1}})
		end
		self._driver = clicker
		clicker:set_attach(self.object, "",
			{x = 0, y = 3.75, z = -1}, {x = 0, y = 0, z = 0})
		clicker:set_properties({ visual_size = driver_visual_size })
		default.player_attached[name] = true
		minetest.after(0.2, function(clicker)
			if clicker:is_player() then
				default.player_set_animation(clicker, "sit" , 30)
			end
		end, clicker)
		clicker:set_look_horizontal(self.object:getyaw())
	end
end


function boat.on_activate(self, staticdata, dtime_s)
	self.object:set_armor_groups({immortal = 1})
	local data = minetest.deserialize(staticdata)
	if type(data) == "table" then
		self._v = data.v
		self._last_v = self._v
		self._itemstring = data.itemstring
		self.object:set_properties({textures=data.textures})
	end
end


function boat.get_staticdata(self)
	return minetest.serialize({
		v = self._v,
		itemstring = self._itemstring,
		textures = self.object:get_properties().textures
	})
end


function boat.on_punch(self, puncher)
	if not puncher or not puncher:is_player() or self._removed then
		return
	end
	if self._driver and puncher == self._driver then
		self._driver = nil
		puncher:set_detach()
		puncher:set_properties({visual_size = {x=1, y=1}})
		default.player_attached[puncher:get_player_name()] = false
	end
	if not self._driver then
		self._removed = true
		if not minetest.settings:get_bool("creative_mode") then
			minetest.add_item(self.object:getpos(), self._itemstring)
		end
		self.object:remove()
	end
end

function boat.on_step(self, dtime)
	self._v = get_v(self.object:getvelocity()) * get_sign(self._v)
	if self._driver then
		local ctrl = self._driver:get_player_control()
		local yaw = self.object:getyaw()
		if ctrl.up then
			self._v = self._v + 0.1

			if self._animation ~= 1 then
				self.object:set_animation({x=0, y=40}, paddling_speed, 0, true)
				self._animation = 1
			end
		elseif ctrl.down then
			self._v = self._v - 0.1

			if self._animation ~= -1 then
				self.object:set_animation({x=0, y=40}, -paddling_speed, 0, true)
				self._animation = -1
			end
		else
			if self._animation ~= 0 then
				self.object:set_animation({x=0, y=40}, 0, 0, true)
				self._animation = 0
			end
		end
		if ctrl.left then
			if self._v < 0 then
				self.object:setyaw(yaw - (1 + dtime) * 0.03)
			else
				self.object:setyaw(yaw + (1 + dtime) * 0.03)
			end
		elseif ctrl.right then
			if self._v < 0 then
				self.object:setyaw(yaw + (1 + dtime) * 0.03)
			else
				self.object:setyaw(yaw - (1 + dtime) * 0.03)
			end
		end
	else
		if self._animation ~= 0 then
			self.object:set_animation({x=0, y=40}, 0, 0, true)
			self._animation = 0
		end
	end
	local velo = self.object:getvelocity()
	if self._v == 0 and velo.x == 0 and velo.y == 0 and velo.z == 0 then
		self.object:setpos(self.object:getpos())
		return
	end
	local s = get_sign(self._v)
	self._v = self._v - 0.02 * s
	if s ~= get_sign(self._v) then
		self.object:setvelocity({x = 0, y = 0, z = 0})
		self._v = 0
		return
	end
	if math.abs(self._v) > 5 then
		self._v = 5 * get_sign(self._v)
	end

	local p = self.object:getpos()
	p.y = p.y - boat_y_offset
	local new_velo
	local new_acce = {x = 0, y = 0, z = 0}
	if not is_water(p) then
		local nodedef = minetest.registered_nodes[minetest.get_node(p).name]
		if (not nodedef) or nodedef.walkable then
			self._v = 0
			new_acce = {x = 0, y = 1, z = 0}
		else
			new_acce = {x = 0, y = -9.8, z = 0}
		end
		new_velo = get_velocity(self._v, self.object:getyaw(),
			self.object:getvelocity().y)
		self.object:setpos(self.object:getpos())
	else
		p.y = p.y + 1
		if is_water(p) then
			local y = self.object:getvelocity().y
			if y >= 5 then
				y = 5
			elseif y < 0 then
				new_acce = {x = 0, y = 20, z = 0}
			else
				new_acce = {x = 0, y = 5, z = 0}
			end
			new_velo = get_velocity(self._v, self.object:getyaw(), y)
			self.object:setpos(self.object:getpos())
		else
			new_acce = {x = 0, y = 0, z = 0}
			if math.abs(self.object:getvelocity().y) < 1 then
				local pos = self.object:getpos()
				pos.y = math.floor(pos.y) + boat_y_offset
				self.object:setpos(pos)
				new_velo = get_velocity(self._v, self.object:getyaw(), 0)
			else
				new_velo = get_velocity(self._v, self.object:getyaw(),
					self.object:getvelocity().y)
				self.object:setpos(self.object:getpos())
			end
		end
	end
	self.object:setvelocity(new_velo)
	self.object:setacceleration(new_acce)
end

minetest.register_entity("boats:boat", boat)

local boat_ids = { "boat", "boat_pine", "boat_aspen", "boat_jungle", "boat_acacia" }
local names = { "Boot aus Holz", "Boot aus Fichtenholz", "Boot aus Birkenholz", "Boot aus Tropenholz", "Boot aus Akazienholz"}
local craftstuffs = {}
if minetest.get_modpath("default") then
	craftstuffs = { "default:wood", "default:pine_wood", "default:aspen_wood", "default:junglewood", "default:acacia_wood" }
end
local images = { "wood", "pine", "aspen", "jungle", "acacia" }

for b=1, #boat_ids do
	local itemstring = "boats:"..boat_ids[b]

	minetest.register_craftitem(itemstring, {
		description = names[b],
		inventory_image = "boats_"..images[b].."_boat.png",
		liquids_pointable = true,
		groups = { boat = 1, transport = 1},
		stack_max = 1,
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end

			local node = minetest.get_node(pointed_thing.under)
			if placer and not placer:get_player_control().sneak then
				if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
					return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer, itemstack) or itemstack
				end
			end

			if not is_water(pointed_thing.under) then
				return
			end
			pointed_thing.under.y = pointed_thing.under.y + boat_y_offset
			local boat = minetest.add_entity(pointed_thing.under, "boats:boat")
			boat:get_luaentity()._itemstring = itemstring
			boat:set_properties({textures = { "boats_texture_"..images[b].."_boat.png" }})
			if not minetest.settings:get_bool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end,
		_on_dispense = function(stack, pos, droppos, dropnode, dropdir)
			local below = {x=droppos.x, y=droppos.y-1, z=droppos.z}
			local belownode = minetest.get_node(below)
			if minetest.get_item_group(dropnode.name, "water") ~= 0 or (dropnode.name == "air" and minetest.get_item_group(belownode.name, "water") ~= 0) then
				minetest.add_entity(droppos, "boats:boat")
			else
				minetest.add_item(droppos, stack)
			end
		end,
	})

	local c = craftstuffs[b]
	minetest.register_craft({
		output = itemstring,
		recipe = {
			{c, "", c},
			{c, c, c},
		},
	})
end

minetest.register_craft({
	type = "fuel",
	recipe = "boats:boat",
	burntime = 28,
})

minetest.register_craft({
	type = "fuel",
	recipe = "boats:boat_jungle",
	burntime = 36,
})

minetest.register_craft({
	type = "fuel",
	recipe = "boats:boat_pine",
	burntime = 24,
})

minetest.register_craft({
	type = "fuel",
	recipe = "boats:boat_aspen",
	burntime = 20,
})

minetest.register_craft({
	type = "fuel",
	recipe = "boats:boat_acacia",
	burntime = 32,
})
