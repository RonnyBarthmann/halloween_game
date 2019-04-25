if minetest.get_modpath("lucky_block") then

	lucky_block:add_blocks({
		{"dro", {"protector:protect"}, 3},
		{"dro", {"protector:protect2"}, 3},
		{"exp", 5, true},
		{"dro", {"protector:tool"}, 1},
		{"exp"},
	})
end
