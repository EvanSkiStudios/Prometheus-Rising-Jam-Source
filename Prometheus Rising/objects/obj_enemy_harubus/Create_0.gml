//stats
z = 0;
hp = 100;
hp_last = hp;
enemy_speed = 0.5;
enemy_view_distance = 400;

var gridsize = obj_ctrl_pathfind.cell_size;
x = ((x div gridsize) * gridsize + (gridsize / 2));
y = ((y div gridsize) * gridsize + (gridsize / 2));



object_is_audioemitter(snd_sfx_outcast_hurt,false,1,z,500,250);

enemy_type = ENEMY_TYPES.HARUBUS;
start_state = ENEMY_AI_STATES.IDLE;
enemy_ai_state = start_state;
enemy_can_shoot = true;
enemy_can_shoot_melee = true;

//sprite info
image_xscale = 0.5;
image_yscale = 0.5;
image_speed = 0;
image_index = 0;

#region sprite_directions
	#region walking
		sprite_walk_dir_array = array_create(8,0);
		sprite_walk_dir_array[0] = spr_enmy_harubus_walk_R;
		sprite_walk_dir_array[1] = spr_enmy_harubus_walk_BR;
		sprite_walk_dir_array[2] = spr_enmy_harubus_walk_B;
		sprite_walk_dir_array[3] = spr_enmy_harubus_walk_BL;
		sprite_walk_dir_array[4] = spr_enmy_harubus_walk_L;
		sprite_walk_dir_array[5] = spr_enmy_harubus_walk_FL;
		sprite_walk_dir_array[6] = spr_enmy_harubus_walk_F;
		sprite_walk_dir_array[7] = spr_enmy_harubus_walk_FR;
	#endregion
	
	#region attack_ranged
		sprite_attack_ranged_dir_array = array_create(8,0);
		sprite_attack_ranged_dir_array[0] = spr_enmy_harubus_attack_ranged_R;
		sprite_attack_ranged_dir_array[1] = spr_enmy_harubus_attack_ranged_BR;
		sprite_attack_ranged_dir_array[2] = spr_enmy_harubus_attack_ranged_B;
		sprite_attack_ranged_dir_array[3] = spr_enmy_harubus_attack_ranged_BL;
		sprite_attack_ranged_dir_array[4] = spr_enmy_harubus_attack_ranged_L;
		sprite_attack_ranged_dir_array[5] = spr_enmy_harubus_attack_ranged_FL;
		sprite_attack_ranged_dir_array[6] = spr_enmy_harubus_attack_ranged_F;
		sprite_attack_ranged_dir_array[7] = spr_enmy_harubus_attack_ranged_FR;
	#endregion
		
	#region melee_ranged
		sprite_attack_melee_dir_array = array_create(1,0);
		sprite_attack_melee_dir_array[0] = 0;
	#endregion


#endregion
//update starting sprite_state
sprite_state = sprite_walk_dir_array;


//pathfinding
my_pos = 0;
my_pathfinding_path = path_add();
xx = path_get_point_x(my_pathfinding_path, my_pos);
yy = path_get_point_y(my_pathfinding_path, my_pos);

//collision
shape = NewColAABBFromMinMax(new Vector3(self.x - 32 , self.y - 32, 0), new Vector3(self.x + 32, self.y + 32, 32));

//collision check array
global.enemy_array[global.enemy_array_index] = id;
global.enemy_array_index += 1;