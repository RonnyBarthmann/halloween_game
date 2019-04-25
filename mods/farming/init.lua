local init = os.clock()
farming = {}
farming.hoe_on_use = default.hoe_on_use

dofile(minetest.get_modpath("farming").."/shared_functions.lua")

local default_path = minetest.get_modpath("farming")

-- ========= HEMP =========
dofile(default_path.."/hemp.lua")

-- ========= CAKE =========
dofile(default_path.."/cake.lua")

-- ========= SOIL =========
dofile(minetest.get_modpath("farming").."/soil.lua")

-- ========= WHEAT =========
dofile(minetest.get_modpath("farming").."/wheat.lua")

-- ========= COTTON =========
dofile(minetest.get_modpath("farming").."/cotton.lua")

-- ========= CORN =========
dofile(default_path.."/corn.lua")

-- ======= PUMPKIN =========
dofile(minetest.get_modpath("farming").."/pumpkin.lua")

-- ========= MELON =========
dofile(minetest.get_modpath("farming").."/melon.lua")

-- ========= CARROT =========
dofile(minetest.get_modpath("farming").."/carrots.lua")

-- ========= POTATOES =========
dofile(minetest.get_modpath("farming").."/potatoes.lua")

-- ========= BEETROOT =========
dofile(minetest.get_modpath("farming").."/beetroot.lua")

-- ========= HIVE =========
--dofile(minetest.get_modpath("farming").."/hive.lua")

-- ========= CRAFTING =========
dofile(minetest.get_modpath("farming").."/crafting.lua")

-- ========= MAPGEN =========
dofile(minetest.get_modpath("farming").."/mapgen.lua")

minetest.register_craftitem("farming:swiss_army_knife", {
	description = "Taschenmesser",
	inventory_image = "farming_swiss_army_knife.png",
	stack_max = 1,
})

local time_to_load= os.clock() - init