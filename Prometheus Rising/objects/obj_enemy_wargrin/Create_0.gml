//stats
z = 0;
hp = 3;
hp_last = hp;
enemy_speed = 2;
enemy_view_distance = 300;

var gridsize = obj_ctrl_pathfind.cell_size;
x = ((x div gridsize) * gridsize + (gridsize / 2));
y = ((y div gridsize) * gridsize + (gridsize / 2));



object_is_audioemitter(snd_sfx_outcast_hurt,false,1,z,200,100);

enemy_type = ENEMY_TYPES.WARGRIN;
start_state = ENEMY_AI_STATES.IDLE;
enemy_ai_state = start_state;
enemy_can_shoot = true;
enemy_can_shoot_melee = true;

//sprite info
image_xscale = 0.3;
image_yscale = 0.3;
image_speed = 0;
image_index = 0;

#region sprite_directions
	#region walking
		sprite_walk_dir_array = array_create(8,0);
		sprite_walk_dir_array[0] = spr_enmy_wargrin_walk_R;
		sprite_walk_dir_array[1] = spr_enmy_wargrin_walk_BR;
		sprite_walk_dir_array[2] = spr_enmy_wargrin_walk_B;
		sprite_walk_dir_array[3] = spr_enmy_wargrin_walk_BL;
		sprite_walk_dir_array[4] = spr_enmy_wargrin_walk_L;
		sprite_walk_dir_array[5] = spr_enmy_wargrin_walk_FL;
		sprite_walk_dir_array[6] = spr_enmy_wargrin_walk_F;
		sprite_walk_dir_array[7] = spr_enmy_wargrin_walk_FR;
	#endregion
	
	#region attack_ranged
		sprite_attack_ranged_dir_array = array_create(8,0);
		sprite_attack_ranged_dir_array[0] = spr_enmy_wargrin_attack_ranged_R;
		sprite_attack_ranged_dir_array[1] = spr_enmy_wargrin_attack_ranged_BR;
		sprite_attack_ranged_dir_array[2] = spr_enmy_wargrin_attack_ranged_B;
		sprite_attack_ranged_dir_array[3] = spr_enmy_wargrin_attack_ranged_BL;
		sprite_attack_ranged_dir_array[4] = spr_enmy_wargrin_attack_ranged_L;
		sprite_attack_ranged_dir_array[5] = spr_enmy_wargrin_attack_ranged_FL;
		sprite_attack_ranged_dir_array[6] = spr_enmy_wargrin_attack_ranged_F;
		sprite_attack_ranged_dir_array[7] = spr_enmy_wargrin_attack_ranged_FR;
	#endregion
		
	#region melee_ranged
		sprite_attack_melee_dir_array = array_create(8,0);
		sprite_attack_melee_dir_array[0] = spr_enmy_wargrin_attack_melee_R;
		sprite_attack_melee_dir_array[1] = spr_enmy_wargrin_attack_melee_BR;
		sprite_attack_melee_dir_array[2] = spr_enmy_wargrin_attack_melee_B;
		sprite_attack_melee_dir_array[3] = spr_enmy_wargrin_attack_melee_BL;
		sprite_attack_melee_dir_array[4] = spr_enmy_wargrin_attack_melee_L;
		sprite_attack_melee_dir_array[5] = spr_enmy_wargrin_attack_melee_FL;
		sprite_attack_melee_dir_array[6] = spr_enmy_wargrin_attack_melee_F;
		sprite_attack_melee_dir_array[7] = spr_enmy_wargrin_attack_melee_FR;
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
shape = NewColAABBFromMinMax(new Vector3(self.x - 16 , self.y - 16, 0), new Vector3(self.x + 16, self.y + 16, 32));

//collision check array
global.enemy_array[global.enemy_array_index] = id;
global.enemy_array_index += 1;