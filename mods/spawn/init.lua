spawn = {}
spawn.pos = {x=0, y=3, z=0}

if minetest.setting_get_pos("static_spawnpoint") then
    spawn.pos = minetest.setting_get_pos("static_spawnpoint")
end

function teleport_to_spawn(name)
    local player = minetest.get_player_by_name(name)
    if player == nil then
        return false
    end
    local pos = player:getpos()
    if pos.x>-20 and pos.x<20 and pos.z>-20 and pos.z<20 then
        minetest.chat_send_player(name, "Already close to spawn!")
    elseif _G['cursed_world'] ~= nil and
        cursed_world.location_y and cursed_world.dimension_y and
        pos.y < (cursed_world.location_y + cursed_world.dimension_y) and    --if player is in cursed world, stay in cursed world
        pos.y > (cursed_world.location_y - cursed_world.dimension_y)
    then   local spawn_pos = vector.round(spawn.pos);
        spawn_pos.y = spawn_pos.y + cursed_world.location_y;
        player:setpos(spawn_pos)
        minetest.chat_send_player(name, "Willkommen in Halloween Town!")
    else
        player:setpos(spawn.pos)
        minetest.chat_send_player(name, "Willkommen in Halloween Town!")
    end
end

minetest.register_chatcommand("spawn", {
    description = "Teleport zum Spawn.",
    func = teleport_to_spawn,
})
