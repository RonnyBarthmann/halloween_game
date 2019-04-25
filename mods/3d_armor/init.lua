ARMOR_MOD_NAME = minetest.get_current_modname()
dofile(minetest.get_modpath(ARMOR_MOD_NAME).."/armor.lua")

minetest.register_tool("3d_armor:helmet_amethyst", {
	description = "Hexenmaske",
	inventory_image = "3d_armor_inv_helmet_amethyst.png",
	groups = {armor_head=5, armor_heal=0, armor_use=100},
	wear = 0,
	_repair_material = "default:amethyst",
})

minetest.register_tool("3d_armor:helmet_topas", {
	description = "Werewolfmaske",
	inventory_image = "3d_armor_inv_helmet_topas.png",
	groups = {armor_head=10, armor_heal=5, armor_use=250},
	wear = 0,
	_repair_material = "default:topas",
})

minetest.register_tool("3d_armor:helmet_ruby", {
	description = "Vampirmaske",
	inventory_image = "3d_armor_inv_helmet_ruby.png",
	groups = {armor_head=15, armor_heal=10, armor_use=500},
	wear = 0,
	_repair_material = "default:ruby",
})

minetest.register_tool("3d_armor:helmet_saphiere",{
	description = "Clownmaske",
	inventory_image = "3d_armor_inv_helmet_saphiere.png",
	groups = {armor_head=20, armor_heal=15, armor_use=750},
	wear = 0,
	_repair_material = "default:saphiere",
})

minetest.register_tool("3d_armor:helmet_emerald", {
	description = "Frankensteinmaske",
	inventory_image = "3d_armor_inv_helmet_emerald.png",
	groups = {armor_head=15, armor_heal=10, armor_use=500},
	wear = 0,
	_repair_material = "default:emerald",
})

minetest.register_tool("3d_armor:chestplate_amethyst", {
	description = "Hexenpullover",
	inventory_image = "3d_armor_inv_chestplate_amethyst.png",
	groups = {armor_torso=15, armor_heal=0, armor_use=100},
	wear = 0,
	_repair_material = "default:amethyst",
})

minetest.register_tool("3d_armor:chestplate_topas", {
	description = "Werewolfhemd",
	inventory_image = "3d_armor_inv_chestplate_topas.png",
	groups = {armor_torso=20, armor_heal=5, armor_use=250},
	wear = 0,
	_repair_material = "default:topas",
})

minetest.register_tool("3d_armor:chestplate_ruby", {
	description = "Vampirsmoking",
	inventory_image = "3d_armor_inv_chestplate_ruby.png",
	groups = {armor_torso=25, armor_heal=10, armor_use=500},
	wear = 0,
	_repair_material = "default:ruby",
})

minetest.register_tool("3d_armor:chestplate_saphiere",{
	description = "Clownshirt",
	inventory_image = "3d_armor_inv_chestplate_saphiere.png",
	groups = {armor_torso=30, armor_heal=15, armor_use=750},
	wear = 0,
	_repair_material = "default:saphiere",
})

minetest.register_tool("3d_armor:chestplate_emerald", {
	description = "Frankensteinjacke",
	inventory_image = "3d_armor_inv_chestplate_emerald.png",
	groups = {armor_torso=25, armor_heal=10, armor_use=500},
	wear = 0,
	_repair_material = "default:emerald",
})

minetest.register_tool("3d_armor:leggings_amethyst", {
	description = "Hexenhose",
	inventory_image = "3d_armor_inv_leggings_amethyst.png",
	groups = {armor_legs=10, armor_heal=0, armor_use=100},
	wear = 0,
	_repair_material = "default:amethyst",
})

minetest.register_tool("3d_armor:leggings_topas", {
	description = "Werewolfhose",
	inventory_image = "3d_armor_inv_leggings_topas.png",
	groups = {armor_legs=15, armor_heal=5, armor_use=250},
	wear = 0,
	_repair_material = "default:topas",
})

minetest.register_tool("3d_armor:leggings_ruby", {
	description = "Vampirhose",
	inventory_image = "3d_armor_inv_leggings_ruby.png",
	groups = {armor_legs=20, armor_heal=10, armor_use=500},
	wear = 0,
	_repair_material = "default:ruby",
})

minetest.register_tool("3d_armor:leggings_saphiere",{
	description = "Clownhose",
	inventory_image = "3d_armor_inv_leggings_saphiere.png",
	groups = {armor_legs=25, armor_heal=15, armor_use=750},
	wear = 0,
	_repair_material = "default:saphiere",
})

minetest.register_tool("3d_armor:leggings_emerald", {
	description = "Frankensteinhose",
	inventory_image = "3d_armor_inv_leggings_emerald.png",
	groups = {armor_legs=20, armor_heal=10, armor_use=500},
	wear = 0,
	_repair_material = "default:emerald",
})

minetest.register_tool("3d_armor:boots_amethyst", {
	description = "Hexenschuhe",
	inventory_image = "3d_armor_inv_boots_amethyst.png",
	groups = {armor_feet=5, armor_heal=0, armor_use=100},
	wear = 0,
	_repair_material = "default:amethyst",
})

minetest.register_tool("3d_armor:boots_topas", {
	description = "Werewolfschuhe",
	inventory_image = "3d_armor_inv_boots_topas.png",
	groups = {armor_feet=10, armor_heal=5, armor_use=250},
	wear = 0,
	_repair_material = "default:topas",
})

minetest.register_tool("3d_armor:boots_ruby", {
	description = "Vampirschuhe",
	inventory_image = "3d_armor_inv_boots_ruby.png",
	groups = {armor_feet=15, armor_heal=10, armor_use=500},
	wear = 0,
	_repair_material = "default:ruby",
})

minetest.register_tool("3d_armor:boots_saphiere",{
	description = "Clownschuhe",
	inventory_image = "3d_armor_inv_boots_saphiere.png",
	groups = {armor_feet=20, armor_heal=15, armor_use=750},
	wear = 0,
	_repair_material = "default:saphiere",
})

minetest.register_tool("3d_armor:boots_emerald", {
	description = "Frankensteinschuhe",
	inventory_image = "3d_armor_inv_boots_emerald.png",
	groups = {armor_feet=15, armor_heal=10, armor_use=500},
	wear = 0,
	_repair_material = "default:emerald",
})

local craft_ingreds = {
	amethyst = { "default:amethyst" },
	topas = { "default:topas" },
	ruby = { "default:ruby" },
	saphiere = { "default:saphiere" },
	emerald = { "default:emerald"} ,
}		

for k, v in pairs(craft_ingreds) do
	local m = v[1]
	local c = v[2]
	if m ~= nil then
		minetest.register_craft({
			output = "3d_armor:helmet_"..k,
			recipe = {
				{m, m, m},
				{m, "", m},
				{"", "", ""},
			},
		})
		minetest.register_craft({
			output = "3d_armor:chestplate_"..k,
			recipe = {
				{m, "", m},
				{m, m, m},
				{m, m, m},
			},
		})
		minetest.register_craft({
			output = "3d_armor:leggings_"..k,
			recipe = {
				{m, m, m},
				{m, "", m},
				{m, "", m},
			},
		})
		minetest.register_craft({
			output = "3d_armor:boots_"..k,
			recipe = {
				{m, "", m},
				{m, "", m},
			},
		})
	end
end