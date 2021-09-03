enum ENEMY_AI_STATES{
	NO_AI,
	IDLE,
	ALERT,
	ATTACK,
	DEATH,
	XDEATH
}

enum ENEMY_TYPES{
	TEST,
	OUTCAST,
	BMONKEY,
	WARGRIN,
	HINDRING,
	HARUBUS
}

function Enemy_ai_perform_state(AI_state){
	
	//if player is dead, then ignore ai
	if !(global.Player_is_alive) AI_state = ENEMY_AI_STATES.NO_AI;
	if (enemy_type == ENEMY_TYPES.TEST) return;
	
	if (global.game_pause){
		if (path_index != -1){
			path_end();	
		}
		sprite_state = sprite_walk_dir_array;
		return;
	}
	
	switch(AI_state){
		
		default:
		case ENEMY_AI_STATES.NO_AI:{
			sprite_state = sprite_walk_dir_array;
			return; 
		}break;
	
		case ENEMY_AI_STATES.IDLE:{
			if (path_index != -1){
				path_end();	
			}
			
			//Line of sight
			if !(global.game_noclip){
				
				var Enemy_line_of_sight = false;
				
				var xx = (obj_player.x + lengthdir_x(1, obj_player.look_dir));
				var yy = (obj_player.y + lengthdir_y(1, obj_player.look_dir));
				
				var raycast = new ColRay( new Vector3(xx, yy, 8), new Vector3(x, y, 8));
				
				var sight_blocked_by_wall = collision_line(x,y,xx,yy,obj_rm_wall,false,false);
				var sight_blocked_by_wall_m = collision_line(x,y,xx,yy,obj_rm_wall_moveable,false,false);
				var sight_blocked_by_door = collision_line(x,y,xx,yy,obj_rm_door,false,false);
				var sight_blocked_by_door_sw = collision_line(x,y,xx,yy,obj_rm_door_sideways,false,false);
				
				if (
					!(sight_blocked_by_wall) &&
					!(sight_blocked_by_wall_m) &&
					!(sight_blocked_by_door) &&
					!(sight_blocked_by_door_sw)
				){
					#region check player
						//looking to move on the x too
						if (obj_player.shape.CheckRay(raycast)){
							if (point_distance_3d(x,y,z, obj_player.x, obj_player.y, obj_player.z) < enemy_view_distance){
								Enemy_line_of_sight = true;
							}else{
								Enemy_line_of_sight = false;	
							}
						
						}
					#endregion
				}else{
					Enemy_line_of_sight = true;	
				}
				
	
				if (Enemy_line_of_sight){
					enemy_ai_state = ENEMY_AI_STATES.ALERT;	
				}
			
			}
			
		}break;
	
		case ENEMY_AI_STATES.ALERT:{
			//face player
			direction = point_direction(x, y, obj_player.x, obj_player.y);
			
			//update sprite info, if we are in this state then we should be moving
			sprite_state = sprite_walk_dir_array;
			
			//check distance from enemy to player
			var player_dist = point_distance_3d(x,y,z,obj_player.x,obj_player.y,obj_player.z);
			
			var xx = (obj_player.x + lengthdir_x(50, obj_player.look_dir) ) + choose(0, 10, 25, -25, -10);
			var yy = (obj_player.y + lengthdir_y(50, obj_player.look_dir) ) + choose(0, 10, 25, -25, -10);
			
			switch(enemy_type){
				
				default:
				case ENEMY_TYPES.OUTCAST:{
					if (player_dist > 100) && (player_dist < 200){
						ai_pathfind(
							global.grid,
							my_pathfinding_path,
							xx,
							yy,
							true,
							enemy_speed,
							path_action_stop,
							false
						);
					}else{
						if (player_dist > 200){
							enemy_ai_state = ENEMY_AI_STATES.IDLE;
						}else{
							enemy_ai_state = ENEMY_AI_STATES.ATTACK;
						}
					}
				}break;
				
				case ENEMY_TYPES.BMONKEY:{
					var xx = (obj_player.x + lengthdir_x(12, obj_player.look_dir) );
					var yy = (obj_player.y + lengthdir_y(12, obj_player.look_dir) );	
				
					if (player_dist >= 16) && (player_dist < 200){
						ai_pathfind(
							global.grid,
							my_pathfinding_path,
							xx,
							yy,
							true,
							enemy_speed,
							path_action_stop,
							false
						);
					}else{
						if (player_dist > 200){
							enemy_ai_state = ENEMY_AI_STATES.IDLE;
						}else{
							enemy_ai_state = ENEMY_AI_STATES.ATTACK;
						}
					}
				}break;
				
				case ENEMY_TYPES.WARGRIN:{
					var xx = (obj_player.x + lengthdir_x(50, obj_player.look_dir) ) + choose(0, 10, 25, -25, -10);
					var yy = (obj_player.y + lengthdir_y(50, obj_player.look_dir) ) + choose(0, 10, 25, -25, -10);
					
					if (player_dist > 100) && (player_dist < 200){
						ai_pathfind(
							global.grid,
							my_pathfinding_path,
							xx,
							yy,
							true,
							enemy_speed,
							path_action_stop,
							false
						);
					}else{
						if (player_dist > 200){
							enemy_ai_state = ENEMY_AI_STATES.IDLE;
						}else{
							enemy_ai_state = ENEMY_AI_STATES.ATTACK;
						}
					}
				}break;
				
				case ENEMY_TYPES.HINDRING:{
					var xx = (obj_player.x + lengthdir_x(12, obj_player.look_dir) );
					var yy = (obj_player.y + lengthdir_y(12, obj_player.look_dir) );	
				
					if (player_dist >= 16) && (player_dist < 300){
						ai_pathfind(
							global.grid,
							my_pathfinding_path,
							xx,
							yy,
							true,
							enemy_speed,
							path_action_stop,
							false
						);
					}else{
						if (player_dist > 300){
							enemy_ai_state = ENEMY_AI_STATES.IDLE;
						}else{
							enemy_ai_state = ENEMY_AI_STATES.ATTACK;
						}
					}
				}break;
				
				case ENEMY_TYPES.HARUBUS:{
					var xx = (obj_player.x + lengthdir_x(100, obj_player.look_dir) );
					var yy = (obj_player.y + lengthdir_y(100, obj_player.look_dir) );	
				
					if (player_dist >= 300){
						ai_pathfind(
							global.grid,
							my_pathfinding_path,
							xx,
							yy,
							true,
							enemy_speed,
							path_action_stop,
							false
						);
					}else{
						//if (player_dist > 500){
						//	enemy_ai_state = ENEMY_AI_STATES.IDLE;
						//else{
							enemy_ai_state = ENEMY_AI_STATES.ATTACK;
						//}
					}
				}break;
				
			}
			
		}break;
		
		case ENEMY_AI_STATES.ATTACK:{
			if (path_index != -1){
				path_end();	
			}
			
			//face player
			direction = point_direction(x, y, obj_player.x, obj_player.y);
			
			//check distance from enemy to player
			var player_dist = point_distance_3d(x,y,z,obj_player.x,obj_player.y,obj_player.z);
		
			//player outside range
			if (
				(enemy_type != ENEMY_TYPES.BMONKEY) && 
				(enemy_type != ENEMY_TYPES.HINDRING)  &&
				(enemy_type != ENEMY_TYPES.HARUBUS)
			){
				if (player_dist > 100){
					enemy_ai_state = ENEMY_AI_STATES.ALERT;	
				}
				
				//shoot if player is not in melee range
				if (player_dist > 16){
					sprite_state = sprite_attack_ranged_dir_array;	
				}
			}
			
			if (
				(enemy_type == ENEMY_TYPES.BMONKEY) ||
				(enemy_type == ENEMY_TYPES.HINDRING)
			){
				if (player_dist > 32){
					enemy_ai_state = ENEMY_AI_STATES.ALERT;	
				}	
			}
			
			if (enemy_type == ENEMY_TYPES.HARUBUS){
				
				if (player_dist > 300){
					var xx = (obj_player.x + lengthdir_x(64, obj_player.look_dir) ) + choose(0, 10, 25, -25, -10);
					var yy = (obj_player.y + lengthdir_y(64, obj_player.look_dir) ) + choose(0, 10, 25, -25, -10);
					
					sprite_state = sprite_walk_dir_array;
					//player is in melee range run away!
					ai_pathfind(
						global.grid,
						my_pathfinding_path,
						xx,
						yy,
						true,
						enemy_speed,
						path_action_stop,
						false
					);
				}else{
					if (player_dist < 300){
						sprite_state = sprite_attack_ranged_dir_array;		
					}
				}	
			}
			
			
			if (enemy_type == ENEMY_TYPES.WARGRIN){
				if (player_dist <= 32) && (player_dist > 16) {
					var xx = (obj_player.x + lengthdir_x(64, obj_player.look_dir) ) + choose(0, 10, 25, -25, -10);
					var yy = (obj_player.y + lengthdir_y(64, obj_player.look_dir) ) + choose(0, 10, 25, -25, -10);
					
					sprite_state = sprite_walk_dir_array;
					//player is in melee range run away!
					ai_pathfind(
						global.grid,
						my_pathfinding_path,
						xx,
						yy,
						true,
						enemy_speed,
						path_action_stop,
						false
					);
				}
			}
			
			if (enemy_type != ENEMY_TYPES.HARUBUS){
				//punch if in melee range
				if (player_dist < 16){
					sprite_state = sprite_attack_melee_dir_array;	
				}
			}
			
		}break;
		
		case ENEMY_AI_STATES.DEATH:{
			instance_destroy();
			//play death animation, turn into dead sprite
		}break;
		
		case ENEMY_AI_STATES.XDEATH:{
			//play death animation, turn into dead sprite
			//BUT WITH STYLE
		}break;
		
	}

}