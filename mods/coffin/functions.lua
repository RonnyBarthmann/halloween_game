local pi = math.pi
local player_in_coffin = 0
local is_sp = minetest.is_singleplayer()
local enable_respawn = minetest.settings:get_bool("enable_coffin_respawn")
if enable_respawn == nil then
	enable_respawn = true
end

-- Helper functions

local function get_look_yaw(pos)
	local n = minetest.get_node(pos)
	if n.param2 == 1 then
		return pi / 2, n.param2
	elseif n.param2 == 3 then
		return -pi / 2, n.param2
	elseif n.param2 == 0 then
		return pi, n.param2
	else
		return 0, n.param2
	end
end

local function is_night_skip_enabled()
	local enable_night_skip = minetest.settings:get_bool("enable_coffin_night_skip")
	if enable_night_skip == nil then
		enable_night_skip = true
	end
	return enable_night_skip
end

local function check_in_coffin(players)
	local in_coffin = coffin.player
	if not players then
		players = minetest.get_connected_players()
	end

	for n, player in ipairs(players) do
		local name = player:get_player_name()
		if not in_coffin[name] then
			return false
		end
	end

	return #players > 0
end

local function lay_down(player, pos, coffin_pos, state, skip)
	local name = player:get_player_name()
	local hud_flags = player:hud_get_flags()

	if not player or not name then
		return
	end

	-- stand up
	if state ~= nil and not state then
		local p = coffin.pos[name] or nil
		if coffin.player[name] ~= nil then
			coffin.player[name] = nil
			player_in_coffin = player_in_coffin - 1
		end
		-- skip here to prevent sending player specific changes (used for leaving players)
		if skip then
			return
		end
		if p then
			player:setpos(p)
		end

		-- physics, eye_offset, etc
		player:set_eye_offset({x = 0, y = 0, z = 0}, {x = 0, y = 0, z = 0})
		player:set_look_horizontal(math.random(1, 180) / 100)
		default.player_attached[name] = false
		player:set_physics_override(1, 1, 1)
		hud_flags.wielditem = true
		default.player_set_animation(player, "stand" , 30)

	-- lay down
	else
		coffin.player[name] = 1
		coffin.pos[name] = pos
		player_in_coffin = player_in_coffin + 1

		-- physics, eye_offset, etc
		player:set_eye_offset({x = 0, y = -13, z = 0}, {x = 0, y = 0, z = 0})
		local yaw, param2 = get_look_yaw(coffin_pos)
		player:set_look_horizontal(yaw)
		local dir = minetest.facedir_to_dir(param2)
		local p = {x = coffin_pos.x + dir.x / 2, y = coffin_pos.y, z = coffin_pos.z + dir.z / 2}
		player:set_physics_override(0, 0, 0)
		player:setpos(p)
		default.player_attached[name] = true
		hud_flags.wielditem = false
		default.player_set_animation(player, "lay" , 0)
	end

	player:hud_set_flags(hud_flags)
end

local function update_formspecs(finished)
	local ges = #minetest.get_connected_players()
	local form_n
	local is_majority = (ges / 2) < player_in_coffin

	if finished then
		form_n = coffin.formspec .. "label[2.7,11; Guten Morgen.]"
	else
		form_n = coffin.formspec .. "label[2.2,11;" .. tostring(player_in_coffin) ..
			" von " .. tostring(ges) .. " Spieler sind im Sarg]"
		if is_majority and is_night_skip_enabled() then
			form_n = form_n .. "button_exit[2,8;4,0.75;force;Nacht Ueberspringen]"
		end
	end

	for name,_ in pairs(coffin.player) do
		minetest.show_formspec(name, "coffin_form", form_n)
	end
end


-- Public functions

function coffin.kick_players()
	for name, _ in pairs(coffin.player) do
		local player = minetest.get_player_by_name(name)
		lay_down(player, nil, nil, false)
	end
end

function coffin.skip_night()
	minetest.set_timeofday(0.23)
end

function coffin.on_rightclick(pos, player)
	local name = player:get_player_name()
	local ppos = player:getpos()
	local tod = minetest.get_timeofday()

	if tod > 0.2 and tod < 0.805 then
		if coffin.player[name] then
			lay_down(player, nil, nil, false)
		end
		minetest.chat_send_player(name, "Du kannst das Bett nur in der Nacht benutzen.")
		return
	end

	-- move to coffin
	if not coffin.player[name] then
		lay_down(player, ppos, pos)
		coffin.set_spawns() -- save respawn positions when entering coffin
	else
		lay_down(player, nil, nil, false)
	end

	if not is_sp then
		update_formspecs(false)
	end

	-- skip the night and let all players stand up
	if check_in_coffin() then
		minetest.after(2, function()
			if not is_sp then
				update_formspecs(is_night_skip_enabled())
			end
			if is_night_skip_enabled() then
				coffin.skip_night()
				coffin.kick_players()
			end
		end)
	end
end


-- Callbacks
-- Only register respawn callback if respawn enabled
if enable_respawn then
	-- respawn player at coffin if enabled and valid position is found
	minetest.register_on_respawnplayer(function(player)
		local name = player:get_player_name()
		local pos = coffin.spawn[name]
		if pos then
			player:setpos(pos)
			return true
		end
	end)
end

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	lay_down(player, nil, nil, false, true)
	coffin.player[name] = nil
	if check_in_coffin() then
		minetest.after(2, function()
			update_formspecs(is_night_skip_enabled())
			if is_night_skip_enabled() then
				coffin.skip_night()
				coffin.kick_players()
			end
		end)
	end
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "coffin_form" then
		return
	end
	if fields.quit or fields.leave then
		lay_down(player, nil, nil, false)
		update_formspecs(false)
	end

	if fields.force then
		update_formspecs(is_night_skip_enabled())
		if is_night_skip_enabled() then
			coffin.skip_night()
			coffin.kick_players()
		end
	end
end)
