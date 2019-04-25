coffin = {}
coffin.player = {}
coffin.pos = {}
coffin.spawn = {}

coffin.formspec = "size[8,15;true]" ..
	"bgcolor[#080808BB; true]" ..
	"button_exit[2,12;4,0.75;leave;Sarg verlassen]"

local modpath = minetest.get_modpath("coffin")

-- Load files

dofile(modpath .. "/functions.lua")
dofile(modpath .. "/api.lua")
dofile(modpath .. "/coffin.lua")
dofile(modpath .. "/spawns.lua")
