stairs = {}

function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 64,
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
end

function stairs.register_slab(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 64,
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local slabpos = nil
			local slabnode = nil
			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local n0 = minetest.get_node(p0)
			local n1 = minetest.get_node(p1)
			local param2 = 0

			local n0_is_upside_down = (n0.name == "stairs:slab_" .. subname and
					n0.param2 >= 20)

			if n0.name == "stairs:slab_" .. subname and not n0_is_upside_down and p0.y+1 == p1.y then
				slabpos = p0
				slabnode = n0
			elseif n1.name == "stairs:slab_" .. subname then
				slabpos = p1
				slabnode = n1
			end
			if slabpos then
				minetest.remove_node(slabpos)
				local fakestack = ItemStack(recipeitem)
				fakestack:set_count(itemstack:get_count())

				pointed_thing.above = slabpos
				local success
				fakestack, success = minetest.item_place(fakestack, placer, pointed_thing)
				if success then
					itemstack:set_count(fakestack:get_count())
				else
					minetest.set_node(slabpos, slabnode)
				end
				return itemstack
			end

			if p0.y-1 == p1.y then
				if n0_is_upside_down  then
					minetest.remove_node(p0)
					local fakestack = ItemStack(recipeitem)
					fakestack:set_count(itemstack:get_count())

					pointed_thing.above = p0
					local success
					fakestack, success = minetest.item_place(fakestack, placer, pointed_thing)
					if success then
						itemstack:set_count(fakestack:get_count())
					else
						minetest.set_node(p0, n0)
					end
					return itemstack
				end

				param2 = 20
			end

			if n0_is_upside_down and p0.y+1 ~= p1.y then
				param2 = 20
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
end

function stairs.register_corner(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:corner_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 64,
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{0, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
end

function stairs.register_curve(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:curve_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 64,
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, 0, 0, 0, 0.5, 0.5},
				{0, 0, -0.5, 0.5, 0.5, 0},
				{0, 0, 0, 0.5, 0.5, 0.5},
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
end

function stairs.register_flat(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:flat_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 64,
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
end

function stairs.register_cover(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:cover_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 64,
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.3750, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
end

function stairs.register_slope(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:slope_" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "stairs_slope.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 64,
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.25, -0.25, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.25, 0.5},
				{-0.5, 0.25, 0.1875, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.25, -0.25, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.25, 0.5},
				{-0.5, 0.25, 0.1875, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
end

function stairs.register_ocorner(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:ocorner_" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "stairs_ocorner.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 64,
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.25, -0.25, 0.25, 0, 0.5},
				{-0.5, 0, 0, 0, 0.25, 0.5},
				{-0.5, 0.25, 0.25, -0.25, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.25, -0.25, 0.25, 0, 0.5},
				{-0.5, 0, 0, 0, 0.25, 0.5},
				{-0.5, 0.25, 0.25, -0.25, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
end

function stairs.register_icorner(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:icorner_" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "stairs_icorner.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 64,
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.25, -0.5, 0.25, 0, 0.5},
				{-0.5, 0, -0.5, 0, 0.25, 0.5},
				{-0.5, 0.25, -0.5, -0.25, 0.5, 0.5},
				{-0.5, 0.25, 0.25, 0.5, 0.5, 0.5},
				{-0.5, 0, 0.0625, 0.5, 0.25, 0.5},
				{-0.5, -0.25, -0.25, 0.5, 0, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
				{-0.5, -0.25, -0.5, 0.25, 0, 0.5},
				{-0.5, 0, -0.5, 0, 0.25, 0.5},
				{-0.5, 0.25, -0.5, -0.25, 0.5, 0.5},
				{-0.5, 0.25, 0.25, 0.5, 0.5, 0.5},
				{-0.5, 0, 0.0625, 0.5, 0.25, 0.5},
				{-0.5, -0.25, -0.25, 0.5, 0, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,
	})
end

minetest.register_abm({
	nodenames = {"group:slabs_replace"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		node.name = minetest.registered_nodes[node.name].replace_name
		node.param2 = node.param2 + 20
		if node.param2 == 21 then
			node.param2 = 23
		elseif node.param2 == 23 then
			node.param2 = 21
		end
		minetest.set_node(pos, node)
	end,
})

function stairs.register_stair_and_corner_and_curve_and_flat_and_cover_and_slab_and_slope_and_ocorner_and_icorner(subname, recipeitem, groups, images, desc_stair, desc_corner, desc_curve, desc_flat, desc_cover, desc_slab, desc_slope, desc_ocorner, desc_icorner, sounds)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
	stairs.register_corner(subname, recipeitem, groups, images, desc_corner, sounds)
	stairs.register_curve(subname, recipeitem, groups, images, desc_curve, sounds)
	stairs.register_flat(subname, recipeitem, groups, images, desc_flat, sounds)
	stairs.register_cover(subname, recipeitem, groups, images, desc_cover, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
	stairs.register_slope(subname, recipeitem, groups, images, desc_slope, sounds)
	stairs.register_ocorner(subname, recipeitem, groups, images, desc_ocorner, sounds)
	stairs.register_icorner(subname, recipeitem, groups, images, desc_icorner, sounds)
end

stairs.register_stair_and_corner_and_curve_and_flat_and_cover_and_slab_and_slope_and_ocorner_and_icorner(
	"wood",
	"default:wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1},
	{"default_wood.png"},
	"Holztreppe",
	"Holzecke",
	"Holzkante",
	"Holzteppich",
	"Holzabdeckung",
	"Holzstufe",
	"Holzrampe",
	"Holzeckrampe",
	"Holzkantrampe",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_corner_and_curve_and_flat_and_cover_and_slab_and_slope_and_ocorner_and_icorner(
	"jungle_wood",
	"default:jungle_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1},
	{"default_junglewood.png"},
	"Tropenholztreppe",
	"Tropenholzecke",
	"Tropenholzkante",
	"Tropenholzteppich",
	"Tropenholzabdeckung",
	"Tropenholzstufe",
	"Tropenholzrampe",
	"Tropenholzeckrampe",
	"Tropenholzkantrampe",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_corner_and_curve_and_flat_and_cover_and_slab_and_slope_and_ocorner_and_icorner(
	"pine_wood",
	"default:pine_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1},
	{"default_pine_wood.png"},
	"Fichtenholztreppe",
	"Fichtenholzecke",
	"Fichtenholzkante",
	"Fichtenholzteppich",
	"Fichtenholzabdeckung",
	"Fichtenholzstufe",
	"Fichtenholzrampe",
	"Fichtenholzeckrampe",
	"Fichtenholzkantrampe",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_corner_and_curve_and_flat_and_cover_and_slab_and_slope_and_ocorner_and_icorner(
	"aspen_wood",
	"default:aspen_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1},
	{"default_aspen_wood.png"},
	"Birkenholztreppe",
	"Birkenholzecke",
	"Birkenholzkante",
	"Birkenholzteppich",
	"Birkenholzabdeckung",
	"Birkenholzstufe",
	"Birkenholzrampe",
	"Birkenholzeckrampe",
	"Birkenholzkantrampe",
	default.node_sound_wood_defaults()
)

stairs.register_stair_and_corner_and_curve_and_flat_and_cover_and_slab_and_slope_and_ocorner_and_icorner(
	"acacia_wood",
	"default:acacia_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, not_in_creative_inventory = 1},
	{"default_acacia_wood.png"},
	"Akazienholztreppe",
	"Akazienholzecke",
	"Akazienholzkante",
	"Akazienholzteppich",
	"Akazienholzabdeckung",
	"Akazienholzstufe",
	"Akazienholzrampe",
	"Akazienholzeckrampe",
	"Akazienholzkantrampe",
	default.node_sound_wood_defaults()
)