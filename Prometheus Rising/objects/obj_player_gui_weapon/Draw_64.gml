var width = (display_get_gui_width()/2);
var height = display_get_gui_height()-sprite_height/2;

if (global.Player_is_alive) && (global.Player_can_move){
	var _w = (keyboard_check(PLAYERBUTTON_MOVE_UP));
	var _s = (keyboard_check(PLAYERBUTTON_MOVE_DOWN));
	var _a = (keyboard_check(PLAYERBUTTON_MOVE_LEFT));
	var _d = (keyboard_check(PLAYERBUTTON_MOVE_RIGHT));
}else{
	if (dis_y != start_dis_y){
		weapon_lower = true;
	}
	
	var _w = false;
	var _s = false;
	var _a = false;
	var _d = false;
}


if (
	(global.allow_view_bob) && 
	(weapon_shown == 0) && 
	(_w || _s || _a || _d) 
){
	if (image_index == 0){
		var sway_speed = 1.5;
		dis_x = wave(width-30, width+20, sway_speed, 0);
		
		//y_wave_two = wave(height+10, height-10, sway_speed, 0);
		dis_y = wave(height-10, height+10, sway_speed/2, 0);
	}else{
		dis_x = width;	
		dis_y = height;
	}
}else{
	if (global.Player_can_move) && (global.Player_is_alive) && (weapon_shown == 0){
		if (image_index == 0){
			dis_x = width;	
			dis_y = height;
		}
	}
	
	if (weapon_rise){
		dis_x = width;
		weapon_lower = false;
		
		if (dis_y != height){
			dis_y -= 4;
			if (dis_y <= height){
				dis_y = height;
				weapon_rise = false;
			}
		}
	}
	
	if (weapon_lower){
		dis_x = width;
		weapon_rise = false;
		
		if (dis_y != start_dis_y){
			dis_y += 4;
			if (dis_y >= start_dis_y){
				dis_y = start_dis_y;
				weapon_lower = false;
			}
		}
	}
	
}

if (image_index == 0){
	draw_sprite_ext(sprite_index,image_index,dis_x,dis_y, image_xscale, image_yscale, image_angle,c_white,1);
}else{
	draw_sprite_ext(sprite_index,image_index,width + shoot_sway*2,height-25, image_xscale, image_yscale, image_angle,c_white,1);
}