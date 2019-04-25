-- Keep these for backwards compatibility
function hbhunger.save_hunger(player)
	hbhunger.set_hunger_raw(player)
end
function hbhunger.load_hunger(player)
	hbhunger.get_hunger_raw(player)
end

-- wrapper for minetest.item_eat (this way we make sure other mods can't break this one)
local org_eat = core.do_item_eat
core.do_item_eat = function(hp_change, replace_with_item, itemstack, user, pointed_thing)
	local old_itemstack = itemstack
	itemstack = hbhunger.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	for _, callback in pairs(core.registered_on_item_eats) do
		local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing, old_itemstack)
		if result then
			return result
		end
	end
	return itemstack
end

-- food functions
local food = hbhunger.food

function hbhunger.register_food(name, hunger_change, replace_with_item, poisen, heal, sound)
	food[name] = {}
	food[name].saturation = hunger_change	-- hunger points added
	food[name].replace = replace_with_item	-- what item is given back after eating
	food[name].poisen = poisen				-- time its poisening
	food[name].healing = heal				-- amount of HP
	food[name].sound = sound				-- special sound that is played when eating
end

function hbhunger.eat(hp_change, replace_with_item, itemstack, user, pointed_thing)
	local item = itemstack:get_name()
	local def = food[item]
	if not def then
		def = {}
		if type(hp_change) ~= "number" then
			hp_change = 1
			--core.log("error", "Wrong on_use() definition for item '" .. item .. "'")
		end
		def.saturation = hp_change * 1.3
		def.replace = replace_with_item
	end
	local func = hbhunger.item_eat(def.saturation, def.replace, def.poisen, def.healing, def.sound)
	return func(itemstack, user, pointed_thing)
end

-- Poison player
local function poisenp(tick, time, time_left, player)
	-- First check if player is still there
	if not player:is_player() then
		return
	end
	time_left = time_left + tick
	if time_left < time then
		minetest.after(tick, poisenp, tick, time, time_left, player)
	else
		hbhunger.poisonings[player:get_player_name()] = hbhunger.poisonings[player:get_player_name()] - 1
		if hbhunger.poisonings[player:get_player_name()] <= 0 then
			-- Reset HUD bar color
			hb.change_hudbar(player, "Leben", nil, nil, "hudbars_icon_health.png", nil, "hudbars_bar_health.png")
		end
	end
	if player:get_hp()-1 > 0 then
		player:set_hp(player:get_hp()-1)
	end
	
end

function hbhunger.item_eat(hunger_change, replace_with_item, poisen, heal, sound)
	return function(itemstack, user, pointed_thing)
		if itemstack:take_item() ~= nil and user ~= nil then
			local name = user:get_player_name()
			local h = tonumber(hbhunger.hunger[name])
			local hp = user:get_hp()
			if h == nil or hp == nil then
				return
			end
			minetest.sound_play({name = sound or "hbhunger_eat_generic", gain = 1}, {pos=user:getpos(), max_hear_distance = 16})

			-- Saturation
			if h < 30 and hunger_change then
				h = h + hunger_change
				if h > 30 then h = 30 end
				hbhunger.hunger[name] = h
				hbhunger.set_hunger_raw(user)
			end
			-- Healing
			if hp < 20 and heal then
				hp = hp + heal
				if hp > 20 then hp = 20 end
				user:set_hp(hp)
			end
			-- Poison
			if poisen then
				hb.change_hudbar(user, "Leben", nil, nil, "hbhunger_icon_health_poison.png", nil, "hbhunger_bar_health_poison.png")
				hbhunger.poisonings[name] = hbhunger.poisonings[name] + 1
				poisenp(1, poisen, 0, user)
			end

			if itemstack:get_count() == 0 then
				itemstack:add_item(replace_with_item)
			else
				local inv = user:get_inventory()
				if inv:room_for_item("main", replace_with_item) then
					inv:add_item("main", replace_with_item)
				else
					minetest.add_item(user:getpos(), replace_with_item)
				end
			end
		end
		return itemstack
	end
end

if minetest.get_modpath("default") ~= nil then
	hbhunger.register_food("default:sweet_apple", 2)
end
if minetest.get_modpath("flowers") ~= nil then
	hbhunger.register_food("flowers:mushroom_brown", 1)
	hbhunger.register_food("flowers:mushroom_purble", 1, "", 3)
end
if minetest.get_modpath("farming") ~= nil then
	hbhunger.register_food("farming:beetroot_item", 1)
	hbhunger.register_food("farming:cake_item", 2)
	hbhunger.register_food("farming:carrot_item", 2)
	hbhunger.register_food("farming:melon_item", 2)
	hbhunger.register_food("farming:potato_item", 2)
	hbhunger.register_food("farming:baked_potato", 4)
	hbhunger.register_food("farming:pumpkin_item", 2)
	hbhunger.register_food("farming:bread", 4)
end

if minetest.get_modpath("mobs") ~= nil then
	hbhunger.register_food("mobs:rabbit_raw", 3, "", 3)
	hbhunger.register_food("mobs:rabbit_cooked", 5)
	hbhunger.register_food("mobs:chicken_egg_fried", 4)
	hbhunger.register_food("mobs:chicken_raw", 3, "", 3)
	hbhunger.register_food("mobs:chicken_cooked", 6)
	hbhunger.register_food("mobs:cheese", 4)
	hbhunger.register_food("mobs:steak_raw", 4, "", 3)
	hbhunger.register_food("mobs:steak", 8)
	hbhunger.register_food("mobs:pork_raw", 3, "", 3)
	hbhunger.register_food("mobs:pork", 7)
	hbhunger.register_food("mobs:meat_raw", 3, "", 3)
	hbhunger.register_food("mobs:meat", 6)
	if minetest.get_modpath("bucket") then 
		hbhunger.register_food("bucket:bucket_milk", 3, "bucket:bucket_empty")
	end
end

if minetest.get_modpath("candys") ~= nil then
	hbhunger.register_food("candys:candy", 2)
	hbhunger.register_food("candys:candy_corn", 1)
	hbhunger.register_food("candys:chocolate", 4)
	hbhunger.register_food("candys:lolly", 3)
end

if minetest.get_modpath("fishing") ~= nil then
	hbhunger.register_food("fishing:fish_raw", 1, "", 3)
	hbhunger.register_food("fishing:fish_cooked", 5)
	hbhunger.register_food("fishing:tune_raw", 2, "", 3)
	hbhunger.register_food("fishing:tune_cooked", 6)
	hbhunger.register_food("fishing:salmon_raw", 3, "", 3)
	hbhunger.register_food("fishing:salmon_cooked", 7)
	hbhunger.register_food("fishing:clownfish_raw", 5)
	hbhunger.register_food("fishing:pufferfish_raw", 5, "", 3)
end

-- player-action based hunger changes
function hbhunger.handle_node_actions(pos, oldnode, player, ext)
	-- is_fake_player comes from the pipeworks, we are not interested in those
	if not player or not player:is_player() or player.is_fake_player == true then
		return
	end
	local name = player:get_player_name()
	local exhaus = hbhunger.exhaustion[name]
	if exhaus == nil then return end
	local new = hbhunger.EXHAUST_PLACE
	-- placenode event
	if not ext then
		new = hbhunger.EXHAUST_DIG
	end
	-- assume its send by main timer when movement detected
	if not pos and not oldnode then
		new = hbhunger.EXHAUST_MOVE
	end
	exhaus = exhaus + new
	if exhaus > hbhunger.EXHAUST_LVL then
		exhaus = 0
		local h = tonumber(hbhunger.hunger[name])
		h = h - 1
		if h < 0 then h = 0 end
		hbhunger.hunger[name] = h
		hbhunger.set_hunger_raw(player)
	end
	hbhunger.exhaustion[name] = exhaus
end

minetest.register_on_placenode(hbhunger.handle_node_actions)
minetest.register_on_dignode(hbhunger.handle_node_actions)
