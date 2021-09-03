look_sensitvity = global.look_sensitvity;

if (global.Player_can_take_damage){
	//check health
	if (global.Player_Health <= 0){
		global.Player_is_alive = false;
	
		if (play_death_sound){
			audio_play_sound(snd_sfx_player_death,100,false);
			play_death_sound = false;
		}
	
		if (display_z != 1){
			display_z -= 1;
			if (display_z <= 1){
				display_z = 1;	
			}
		}
	}else{
		display_z = z + CELLSCALE32/2;
		global.Player_is_alive = true;
	}

	if (global.Player_is_alive){
		if (global.Player_Health < hp_last){
			var pain_sound = choose(snd_sfx_player_hurt,snd_sfx_player_hurt2);
			audio_play_sound(pain_sound,1,false);
			hp_last = global.Player_Health;
		}
		
		if (global.Player_Health > hp_last){
			hp_last = global.Player_Health;
		}	
	}
	
	//regen health
	if (global.Player_Health < global.Player_MAX_Health){
		if (allow_regen){
			alarm[1] = GAME_SPEED * 2;
			allow_regen = false;
		}
	}
}else{
	global.Player_Health = hp_last;
}



//reset
if !(global.Player_is_alive) && (display_z = 1){
	if (wait_for_reset){
		alarm[0] = GAME_SPEED/2;
		wait_for_reset = false;
	}
}

//audio
audio_listener_position(x, y, z);

//fell out of world, reset
if (z <= -10000){
	zspeed = 0;
	z = 0;
}


//get mouse move direction - mouse dpi
if (global.Player_can_move) && (global.lock_mouse){
	//center mouse
	window_set_cursor(cr_none);
	window_mouse_set(window_get_width() / 2, window_get_height() / 2);

	look_dir -= (window_mouse_get_x() - window_get_width() /2) / look_sensitvity;
	
	if (global.player_allow_viewpitch){
		look_pitch += (window_mouse_get_y() - window_get_height() /2) / look_sensitvity;
	}
}else{
	if (global.Player_can_move){
		if (window_get_cursor() == cr_none){
			window_set_cursor(cr_arrow);	
		}
	}
}

look_dir = look_dir mod(360);
direction = look_dir;

look_pitch = clamp(look_pitch, -80, 80);

/*
0° right, 
90° up, 
180° left 
270° down
*/

//player input
Player_check_keys();

// look_dir
// forward +0
// backward +180
// strafe left + 90
// strafe right +270
//show_debug_message("dcos " + string( dcos(look_dir)) );
//show_debug_message("dsin " + string( dsin(look_dir)) );

// up	 dsin	 1.00
// down	 dsin	-1.00
// left	 dcos	-1.00
// right dcos	 1.00

if (global.Player_is_alive) && (global.Player_can_move){
	var _w = (keyboard_check(PLAYERBUTTON_MOVE_UP));
	var _s = (keyboard_check(PLAYERBUTTON_MOVE_DOWN));
	var _a = (keyboard_check(PLAYERBUTTON_MOVE_LEFT));
	var _d = (keyboard_check(PLAYERBUTTON_MOVE_RIGHT));
}else{
	var _w = false;
	var _s = false;
	var _a = false;
	var _d = false;
}
var dx = 0;
var dy = 0;


if (_w){
	dx += dcos(look_dir) * move_speed;
	dy -= dsin(look_dir) * move_speed;
}

if (_s){
	dx -= dcos(look_dir) * move_speed;
	dy += dsin(look_dir) * move_speed;
}

if (_a){
	dx -= dsin(look_dir) * move_speed;
	dy -= dcos(look_dir) * move_speed;			
}

if (_d){
	dx += dsin(look_dir) * move_speed;
	dy += dcos(look_dir) * move_speed;		
}

if !(global.game_noclip){
	//add a bit to the Z so we arent colliding even though we are on top of it
	shape.position.z += 0.01;

#region old stuff
/* 
	//looking to move on the x too
	shape.position.x = (x + dx);
	//loop through walls checking their colision shapes against where we want to go
	var number_of_walls = array_length(global.walls_array);
	
	for (var i = 0; i < number_of_walls; ++i){
		var wall = global.walls_array[i];
		
		if (wall.shape.CheckAABB(shape)){
			dx = 0;
			break;
		}
	}
	//move on the x
	x += dx;
	//reset shape position
	shape.position.x = x;

	//same as above but for y
	shape.position.y = (y + dy);
	for (var i = 0; i < number_of_walls; ++i){
		var wall = global.walls_array[i];
		if (wall.shape.CheckAABB(shape)){
			dy = 0;
			break;
		}
	}
	y += dy;
	shape.position.y = y;
	*/
#endregion

#region check walls
	//create local variable for array
	var walls_array = global.walls_array;
	//set veriable to resized array
	var number_of_walls = array_length(walls_array);
	
	//check for collision
	for (var i = 0; i < number_of_walls; ++i){
		var wall = walls_array[i];
		
		if !(instance_exists(wall)){
			array_delete(walls_array,i,1);
			var number_of_walls = array_length(walls_array);
			i = 0;
		}else{
			if (dx != 0){
				//looking to move on the x too
				shape.position.x = (x + dx);
				if (wall.shape.CheckAABB(shape)){
					dx = 0;
				}
				//reset shape position
				shape.position.x = x;
			}
		
			if (dy != 0){
				shape.position.y = (y + dy);
				if (wall.shape.CheckAABB(shape)){
					dy = 0;
				}
				//reset shape position
				shape.position.y = y;
			}
		}
	}
#endregion

#region check doors
	//create local variable for array
	var doors_array = global.doors_array;
	//set veriable to resized array
	var number_of_doors = array_length(doors_array);
	
	//check for collision
	for (var i = 0; i < number_of_doors; ++i){
		var door = doors_array[i];
		
		if !(instance_exists(door)){
			array_delete(doors_array,i,1);
			var number_of_doors = array_length(doors_array);
			i = 0;
		}else{
		
			var door_type = object_get_name(door.object_index);
			
			var check_door = true;
			
			if (door_type != "obj_rm_wall_moveable"){
				if (door.shape.position.z >= display_z){
					check_door = false;
				}
			}else{
				//display z = 16, 16 * 4 = 64, wall is 32x32
				if (door.z > (display_z * 4)){
					check_door = false;
				}
			}
		
			if (check_door){
				if (dx != 0){
					//looking to move on the x too
					shape.position.x = (x + dx);
					if (door.shape.CheckAABB(shape)){
						dx = 0;
					}
					//reset shape position
					shape.position.x = x;
				}
		
				if (dy != 0){
					shape.position.y = (y + dy);
					if (door.shape.CheckAABB(shape)){
						dy = 0;
					}
					//reset shape position
					shape.position.y = y;
				}
			}
		}
	}
#endregion
	//move
	x += dx;
	y += dy;
	//reset shape position
	shape.position.x = x;
	shape.position.y = y;


	//reset z check
	shape.position.z -= 0.01;
}else{
	//noclip moving
	x += dx;
	shape.position.x = x;
	y += dy;
	shape.position.y = y;
}

/*
if keyboard_check_pressed(vk_space){
	zspeed = 2;	
}

//looking to move on the x too
shape.position.z = (z + zspeed + display_z/2);
var floor_plane = obj_ctrl_model_loader;
if (floor_plane.floor_shape.CheckAABB(shape)){
	zspeed = 0;
}
//move on the x
z += zspeed;

zspeed -= 0.075;
zspeed = clamp(zspeed, -500.075, 500.075);

//reset shape position
shape.position.z = (z + zspeed + display_z/2);
*/

/*
if (global.allow_view_bob){
	if (_w || _a || _s || _d){
		var scale = CELLSCALE32/2;
		display_z = wave(scale - 1, scale + 1, 0.7, 0);
	}else{
		display_z = CELLSCALE32/2;
	}
}
*/