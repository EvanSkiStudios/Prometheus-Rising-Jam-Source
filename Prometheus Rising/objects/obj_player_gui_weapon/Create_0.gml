sprite_index = spr_wep_hand;
image_speed = 0;
animation_speed = 2;
image_index = 0;
image_xscale = 3;
image_yscale = 3;

shoot_sway = 0;
weapon_is_shooting = 0;
weapon_is_shooting_fail = false;	

weapon_fired_once = false;

weapon_rise = true;
weapon_lower = false;

start_dis_y = display_get_gui_height()+sprite_height/2;
dis_y = start_dis_y;