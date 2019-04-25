dye = {}

dye.dyes = {
	{"red",		"Rot",			"#ff0000"},
	{"orange",	"Qrange",		"#ff8000"},
	{"yellow",	"Gelb",			"#ffff00"},
	{"lime", 	"Lindgruen",		"#80ff00"},
	{"green",	"Gruen",		"#00ff00"},
	{"jade",	"Jaden",		"#00ff80"},
	{"cyan",	"Himmelblau",		"#00ffff"},
	{"blue",	"Blau",			"#0080ff"},
	{"night",	"Nachtblau",		"#0000ff"},
	{"purble",	"Lilan",		"#8000ff"},
	{"pink",	"Pink",			"#ff00ff"},
	{"violet",	"Violet",		"#ff0080"},
	{"dark_red",	"Dunkelrot",		"#800000"},
	{"brown",	"Braun",		"#804000"},
	{"gold",	"Golden",		"#808000"},
	{"dark_lime",	"Dunkellintgruen",	"#408000"},
	{"dark_green",	"Dunkelgruen",		"#008000"},
	{"dark_jade",	"Dunkeljaden",		"#008040"},
	{"dark_cyan",	"Dunkelhimmelblau",	"#004040"},
	{"dark_blue",	"Dunkelblau",		"#004080"},
	{"dark_night",	"Dunkelnachtblau",	"#000040"},
	{"dark_purble",	"Dunkellilan",		"#400040"},
	{"rose",	"Rosan",		"#ff80ff"},
	{"magenta",	"Magentan",		"#800040"},
	{"black", 	"Schwarz",		"#000000"},
	{"grey",	"Grau",			"#404040"},
	{"silver",	"Silbern",		"#808080"},
	{"white",	"Weiss",		"#ffffff"}
}

for _, row in ipairs(dye.dyes) do
	local name = row[1]
	local desc = row[2]
	local col = row[3]
	local groups = {dye = 1, cracky = 3}
	groups["color_" .. name] = 1

	minetest.register_craftitem("dye:" .. name, {
		description = desc .."e Farbe",
		inventory_image = "dye_base.png^(dye_inv.png^[colorize:" .. col .. "ff)",
		stack_max = 64,
		groups = groups,
	})

	minetest.register_craft({
		output = "dye:" .. name .. " 4",
		recipe = {
			{"group:flower,color_" .. name}
		},
	})
end

minetest.register_craft({
	output = "dye:black 4",
	recipe = {
		{"group:coal"}
	},
})

minetest.register_craft({
	output = "dye:blue 2",
	recipe = {
		{"default:blueberries"}
	},
})

-- Mix recipes

local dye_recipes = {
	{"yellow", "red", "orange"},
	{"green", "red", "brown"},
	{"grey", "orange", "brown"},
	{"grey", "yellow", "gold"},
	{"yellow", "green", "lime"},
	{"orange", "green", "dark_lime"},
	{"grey", "lime", "dark_lime"},
	{"yellow", "blue", "green"},
	{"grey", "green", "dark_green"},
	{"yellow", "night", "dark_green"},
	{"white", "green", "jade"},
	{"grey", "jade", "dark_jade"},
	{"white", "blue", "cyan"},
	{"grey", "cyan", "dark_cyan"},
	{"black", "blue", "night"},
	{"grey", "blue", "dark_blue"},
	{"grey", "night", "dark_night"},
	{"red", "night", "purble"},
	{"grey", "purble", "dark_purble"},
	{"orange", "blue", "violet"},
	{"red", "blue", "magenta"},
	{"grey", "red", "dark_red"},
	{"white", "red", "rose"},
	{"black", "white", "grey"},
	{"grey", "white", "silver"}
}

for _, mix in pairs(dye_recipes) do
	minetest.register_craft({
		type = "shapeless",
		output = 'dye:' .. mix[3] .. ' 2',
		recipe = {'dye:' .. mix[1], 'dye:' .. mix[2]},
	})
end
