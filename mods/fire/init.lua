fire = {}

minetest.register_node("fire:flame", {
	description = "Spektralfeuer",
	drawtype = "firelike",
	tiles = {
		{
			name = "fire_basic_flame_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1
			},
		},
	},
	inventory_image = "fire_basic_flame.png",
	paramtype = "light",
	light_source = 13,
	walkable = false,
	buildable_to = true,
	use_texture_alpha = true,
	sunlight_propagates = true,
	damage_per_second = 4,
	groups = {igniter = 2, dig_immediate = 3},
	drop = "",
	sounds = default.node_sound_leaves_defaults()
})

minetest.register_tool("fire:flint_and_steel", {
	description = "Feuerzeug",
	inventory_image = "fire_flint_steel.png",
	sound = {breaks = "default_tool_breaks"},

	on_use = function(itemstack, user, pointed_thing)
		local sound_pos = pointed_thing.above or user:get_pos()
		minetest.sound_play(
			"fire_flint_and_steel",
			{pos = sound_pos, gain = 0.5, max_hear_distance = 8}
		)
		local player_name = user:get_player_name()
		if pointed_thing.type == "node" then
			local node_under = minetest.get_node(pointed_thing.under).name
			local nodedef = minetest.registered_nodes[node_under]
			if not nodedef then
				return
			end
			if minetest.is_protected(pointed_thing.under, player_name) then
				minetest.chat_send_player(player_name, "Dieser Bereich ist geschuetzt!")
				return
			end
			if nodedef.on_ignite then
				nodedef.on_ignite(pointed_thing.under, user)
			elseif minetest.get_node(pointed_thing.above).name == "air" then
				minetest.set_node(pointed_thing.above, {name = "fire:flame"})
			end
		end
		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(player_name)) then
			local wdef = itemstack:get_definition()
			itemstack:add_wear(1000)
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks, {pos = sound_pos, gain = 0.5})
			end
			return itemstack
		end
	end
})

minetest.register_craft({
	output = "fire:flint_and_steel",
	recipe = {
		{"default:flint", "default:steel_ingot"}
	}
})

local flame_sound = minetest.settings:get_bool("flame_sound")
if flame_sound == nil then
	flame_sound = true
end

if flame_sound then

	local handles = {}
	local timer = 0
	local radius = 8
	local cycle = 3

	function fire.update_player_sound(player)
		local player_name = player:get_player_name()
		-- Search for flame nodes in radius around player
		local ppos = player:getpos()
		local areamin = vector.subtract(ppos, radius)
		local areamax = vector.add(ppos, radius)
		local fpos, num = minetest.find_nodes_in_area(
			areamin,
			areamax,
			{"fire:flame"}
		)
		local flames = (num["fire:basic_flame"] or 0) +
			(num["fire:permanent_flame"] or 0)
		if handles[player_name] then
			minetest.sound_stop(handles[player_name])
			handles[player_name] = nil
		end
		if flames > 0 then
			local fposmid = fpos[1]
			if #fpos > 1 then
				local fposmin = areamax
				local fposmax = areamin
				for i = 1, #fpos do
					local fposi = fpos[i]
					if fposi.x > fposmax.x then
						fposmax.x = fposi.x
					end
					if fposi.y > fposmax.y then
						fposmax.y = fposi.y
					end
					if fposi.z > fposmax.z then
						fposmax.z = fposi.z
					end
					if fposi.x < fposmin.x then
						fposmin.x = fposi.x
					end
					if fposi.y < fposmin.y then
						fposmin.y = fposi.y
					end
					if fposi.z < fposmin.z then
						fposmin.z = fposi.z
					end
				end
				fposmid = vector.divide(vector.add(fposmin, fposmax), 2)
			end
			local handle = minetest.sound_play(
				"fire_fire",
				{
					pos = fposmid,
					to_player = player_name,
					gain = math.min(0.06 * (1 + flames * 0.125), 0.18),
					max_hear_distance = 32,
					loop = true, -- In case of lag
				}
			)
			if handle then
				handles[player_name] = handle
			end
		end
	end

	minetest.register_globalstep(function(dtime)
		timer = timer + dtime
		if timer < cycle then
			return
		end

		timer = 0
		local players = minetest.get_connected_players()
		for n = 1, #players do
			fire.update_player_sound(players[n])
		end
	end)

	minetest.register_on_leaveplayer(function(player)
		local player_name = player:get_player_name()
		if handles[player_name] then
			minetest.sound_stop(handles[player_name])
			handles[player_name] = nil
		end
	end)
end

function fire.update_sounds_around(pos)
end

minetest.register_abm({
	label = "Extinguish flame",
	nodenames = {"fire:flame"},
	neighbors = {"group:puts_out_fire"},
	interval = 3,
	chance = 1,
	catch_up = false,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.remove_node(pos)
		minetest.sound_play("fire_extinguish_flame",
			{pos = pos, max_hear_distance = 16, gain = 0.15})
	end,
})
