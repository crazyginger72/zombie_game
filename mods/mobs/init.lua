dofile(minetest.get_modpath("mobs").."/api.lua")

mobs:register_mob("mobs:zombie", {
	type = "monster",
	hp_max = 16,
	collisionbox = {-0.3,-1.0,-0.3, 0.3,0.8,0.3},
	visual = "mesh",
	mesh = "character.b3d",--"mobs_stone_monster.x",
	textures = {"charactermz.png"},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 50,
	walk_velocity = 1.5,
	run_velocity = 8,
	damage = 3,
	drops = {
		{name = "mapgen:dirt",
		chance = 1,
		min = 3,
		max = 5,},
	},
	armor = 50,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	}
})
mobs:register_spawn("mobs:zombie", {"default:dirt","default:dirt_with_grass","default:sand","default:desertsand"}, 20, -20, 120, 3, 31000)

mobs:register_mob("mobs:zombie_sheep", {
	type = "monster",
	hp_max = 200,
	collisionbox = {-0.4, -0.01, -0.6, 0.4, 0.9, 0.4},
	textures = {"mobs_sheep.png"},
	visual = "mesh",
	mesh = "mobs_sheep.x",
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 8,
	attack_type = "dogfight",
	damage = 3,
	disable_fall_damage = true,
	visual_size = {x=1, y=1},
	armor = 100,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	sounds = {
		random = "mobs_sheep",
	},
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 80,
		walk_start = 81,
		walk_end = 100,
	},
	follow = "farming:wheat",
	view_range = 50,
	
	on_rightclick = nil, --[[function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "farming:wheat" then
			if not self.tamed then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.tamed = true
			elseif self.naked then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.food = (self.food or 0) + 1
				if self.food >= 8 then
					self.food = 0
					self.naked = false
					self.object:set_properties({
						textures = {"mobs_sheep.png"},
						mesh = "mobs_sheep.x",
					})
				end
			end
			return
		end
	end,]]--
})
mobs:register_spawn("mobs:zombie_sheep", {"default:dirt","default:dirt_with_grass","default:sand","default:desertsand",}, 20, -20, 90, 3, 31000)

minetest.register_craftitem("mobs:meat_raw", {
	description = "Raw Meat",
	inventory_image = "mobs_meat_raw.png",
})

minetest.register_craftitem("mobs:meat", {
	description = "Meat",
	inventory_image = "mobs_meat.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:meat",
	recipe = "mobs:meat_raw",
	cooktime = 5,
})
