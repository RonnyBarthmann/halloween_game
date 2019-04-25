default = {}

default.LIGHT_MAX = 14

minetest.register_on_joinplayer(function(player)
	player:set_formspec_prepend([[
			bgcolor[#dd800dBB;true]
			background[5,5;1,1;gui_formbg.png;true]
			listcolors[#4e2e0369;#1f170c;#000000ff;#4e2e03;#FFF] ]])
end)

function default.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

default.gui_survival_form = "size[8,8.5]"..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"list[current_player;craft;1.75,0.5;3,3;]"..
			"list[current_player;craftpreview;5.75,1.5;1,1;]"..
			"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			default.get_hotbar_bg(0,4.25)

local default_path = minetest.get_modpath("default")

dofile(default_path.."/functions.lua")
dofile(default_path.."/trees.lua")
dofile(default_path.."/nodes.lua")
dofile(default_path.."/underwater.lua")
dofile(default_path.."/cocoa.lua")
dofile(default_path.."/plants.lua")
dofile(default_path.."/ores.lua")
dofile(default_path.."/liquids.lua")
dofile(default_path.."/furnace.lua")
dofile(default_path.."/item_entity.lua")
dofile(default_path.."/items.lua")
dofile(default_path.."/tools.lua")
dofile(default_path.."/crafting.lua")
dofile(default_path.."/mapgen.lua")
dofile(default_path.."/aliases.lua")
dofile(default_path.."/legacy.lua")