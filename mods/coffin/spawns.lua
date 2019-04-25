local world_path = minetest.get_worldpath()
local org_file = world_path .. "/coffin_spawns"
local file = world_path .. "/coffin_spawns"
local bkwd = false

-- check for PA's coffin mod spawns
local cf = io.open(world_path .. "/coffin_player_spawns", "r")
if cf ~= nil then
	io.close(cf)
	file = world_path .. "/coffin_player_spawns"
	bkwd = true
end

function coffin.read_spawns()
	local spawns = coffin.spawn
	local input = io.open(file, "r")
	if input and not bkwd then
		repeat
			local x = input:read("*n")
			if x == nil then
				break
			end
			local y = input:read("*n")
			local z = input:read("*n")
			local name = input:read("*l")
			spawns[name:sub(2)] = {x = x, y = y, z = z}
		until input:read(0) == nil
		io.close(input)
	elseif input and bkwd then
		coffin.spawn = minetest.deserialize(input:read("*all"))
		input:close()
		coffin.save_spawns()
		os.rename(file, file .. ".backup")
		file = org_file
	end
end

coffin.read_spawns()

function coffin.save_spawns()
	if not coffin.spawn then
		return
	end
	local data = {}
	local output = io.open(org_file, "w")
	for k, v in pairs(coffin.spawn) do
		table.insert(data, string.format("%.1f %.1f %.1f %s\n", v.x, v.y, v.z, k))
	end
	output:write(table.concat(data))
	io.close(output)
end

function coffin.set_spawns()
	for name,_ in pairs(coffin.player) do
		local player = minetest.get_player_by_name(name)
		local p = player:getpos()
		-- but don't change spawn location if borrowing a coffin
		if not minetest.is_protected(p, name) then
			coffin.spawn[name] = p
		end
	end
	coffin.save_spawns()
end
