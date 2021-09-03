weapon_shown = (weapon_rise) + (weapon_lower);

if (global.Player_can_move) && (global.Player_is_alive) && (weapon_shown == 0)	{
	var shoot_act = mouse_check_button_pressed(PLAYERBUTTON_SHOOT);
	var shoot_act_held = mouse_check_button(PLAYERBUTTON_SHOOT);
}else{
	var shoot_act = false;
	var shoot_act_held = false;	
}

var selected_weapon = global.player_weapon_selected;

if (shoot_act){
	if (image_index == 0){
		image_speed = animation_speed;	
		weapon_is_shooting = 1;
	}
}

if (shoot_act_held){
	if (weapon_is_shooting != 2){
		if (image_index == 0){
			image_speed = animation_speed;	
			weapon_is_shooting = 1;
			
			if (global.Difficulty_allow_weapon_sway){
				if (weapon_fired_once) && (image_index <= (image_number/2) - 1){
					shoot_sway = choose(0, 10, -10);
				}else{
					shoot_sway = 0;
					weapon_fired_once = true;	
				}
			}else{
				shoot_sway = 0;	
			}
		}
	}
}

if (weapon_is_shooting == 1){
	global.Player_weapon_canswitch = false;
	if (image_index >= image_number - 1){
		sprite_index = selected_weapon;
		image_speed = 0;
		
		switch(selected_weapon){
			default:
			case WEAPON_LIST.HAND_1:{
				var player_mana = global.Player_Mana_orng;
				var weapon_mana_cost = 1;
				
				if (player_mana >= weapon_mana_cost){
					//create bullet
					var xx = obj_player.x + lengthdir_x(16, obj_player.look_dir);
					var yy = obj_player.y + lengthdir_y(16, obj_player.look_dir);

					var bullet = instance_create_depth(xx,yy, 16, obj_bullet_fire);
					global.Player_Mana_orng -= weapon_mana_cost;		
					bullet.sprite_index = spr_weapon_fire;
					bullet.direction = obj_player.look_dir + shoot_sway;
					bullet.speed = 16;
					bullet.damage = 1;
					
					alarm[0] = GAME_SPEED /2;
					weapon_is_shooting = 2;
				}else{
					weapon_is_shooting_fail = true;
				}
			}break;
			
			case WEAPON_LIST.HAND_2:{
				var player_mana = global.Player_Mana_blue;
				var weapon_mana_cost = 5;
				
				if (player_mana >= weapon_mana_cost){
					//create bullet
					var xx = obj_player.x + lengthdir_x(16, obj_player.look_dir);
					var yy = obj_player.y + lengthdir_y(16, obj_player.look_dir);

					var bullet = instance_create_depth(xx,yy, 16, obj_bullet_fire);
					global.Player_Mana_blue -= weapon_mana_cost;		
					bullet.sprite_index = spr_weapon_fire_blue;
					bullet.direction = obj_player.look_dir  + shoot_sway;
					bullet.speed = 16;
					bullet.damage = 3;
					
					alarm[0] = GAME_SPEED /16;
					weapon_is_shooting = 2;
				}else{
					weapon_is_shooting_fail = true;
				}
				
			}break;
			
			case WEAPON_LIST.HAND_3:{
				var player_mana = global.Player_Mana_purp;
				var weapon_mana_cost = 10;
				
				if (player_mana >= weapon_mana_cost){
					//create bullet
					var xx = obj_player.x + lengthdir_x(16, obj_player.look_dir);
					var yy = obj_player.y + lengthdir_y(16, obj_player.look_dir);

					global.Player_Mana_purp -= weapon_mana_cost;	
					for (var i = 1; i < 3; ++i){
						
						var bullet = instance_create_depth(xx,yy, 16, obj_bullet_fire);	
						bullet.sprite_index = spr_weapon_fire_purple;
						bullet.direction = obj_player.look_dir  + shoot_sway;
						bullet.speed = 16;
						bullet.damage = 1;
						
						var bullet = instance_create_depth(xx,yy, 16, obj_bullet_fire);	
						bullet.sprite_index = spr_weapon_fire_purple;
						bullet.direction = obj_player.look_dir + 10;
						bullet.speed = 16;
						bullet.damage = 0.5;
						
						var bullet = instance_create_depth(xx,yy, 16, obj_bullet_fire);	
						bullet.sprite_index = spr_weapon_fire_purple;
						bullet.direction = obj_player.look_dir - 10  + shoot_sway;
						bullet.speed = 16;
						bullet.damage = 0.5;
					}
					
					alarm[0] = GAME_SPEED * 0.8;
					weapon_is_shooting = 2;
				}else{
					weapon_is_shooting_fail = true;
				}
			}break;
			
			case WEAPON_LIST.HAND_4:{
				var player_mana = global.Player_Mana_green;
				var weapon_mana_cost = global.Player_MAX_Mana;
				
				if (player_mana >= global.Player_MAX_Mana){
					//create bullet
					var xx = obj_player.x + lengthdir_x(16, obj_player.look_dir);
					var yy = obj_player.y + lengthdir_y(16, obj_player.look_dir);

					if !instance_exists(obj_bullet_fire_giant){
						var bullet = instance_create_depth(xx,yy, 16, obj_bullet_fire_giant);
						global.Player_Mana_green -= weapon_mana_cost;
						bullet.direction = obj_player.look_dir;
						bullet.travelspeed = 16;
						bullet.damage = 10;
					}
				
					if (obj_bullet_fire_giant.image_xscale == 1) && (obj_bullet_fire_giant.image_yscale == 1){
						alarm[0] = GAME_SPEED /2;
						weapon_is_shooting = 2;
					}
				}else{
					if !instance_exists(obj_bullet_fire_giant){
						weapon_is_shooting_fail = true;
					}
				}
			}break;
				
		}
	}
}

if (weapon_is_shooting == 3){
	if (image_index >= image_number - 1){
		image_speed = 0;
		sprite_index = spr_wep_hand;
		image_index = 0;
		weapon_is_shooting = 0;
	}
}

if (weapon_is_shooting_fail) && (weapon_is_shooting = 1){
	if audio_is_playing(snd_sfx_wep_cast_nomana) audio_stop_sound(snd_sfx_wep_cast_nomana);
	audio_play_sound(snd_sfx_wep_cast_nomana,100,false);
	alarm[0] = GAME_SPEED /2;
	weapon_is_shooting = 2;
}