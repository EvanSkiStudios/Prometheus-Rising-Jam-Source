var display_width = display_get_gui_width();
var display_height = display_get_gui_height();

if !(global.Show_HUD) exit;

if (global.display_crosshair){
	draw_sprite_ext(
		spr_crosshair,
		0,
		display_width/2,
		display_height/2,
		1,
		1,
		image_angle,
		c_white,
		1
	);
}

if (global.Player_item_red_key){
	draw_sprite(
		spr_item_door_keys,
		1,
		(display_width - 160),
		(display_height - display_height) + 70
	)	
}
if (global.Player_item_yellow_key){
	draw_sprite(
		spr_item_door_keys,
		2,
		(display_width - 96),
		(display_height - display_height) + 70
	)	
}
if (global.Player_item_blue_key){
	draw_sprite(
		spr_item_door_keys,
		0,
		(display_width - 32),
		(display_height - display_height) + 70
	)	
}


var width_20 = (20 + ( display_width - display_width ) );
var height_20 = (20 + display_height - display_height);
var health_bar_height = ( display_height - 100);
var health_perc = string( floor(percent_of(global.Player_Health, global.Player_MAX_Health)) )+"%";
var cross_icon = ("+");


draw_set_font(global.font_Doom_small);

if (global.game_message != "") && (draw_message){
	//message
	draw_text_color(
		width_20,
		height_20,
		global.game_message,
		HUD_TEXTCOLOR_BRIGHT_RED,
		HUD_TEXTCOLOR_BRIGHT_RED,
		HUD_TEXTCOLOR_DARK_RED,
		HUD_TEXTCOLOR_DARK_RED,
		global.HUD_ALPHA
	);
}

if (draw_message) && (draw_message_reset == 0){
	message_last = global.game_message;
	alarm[0] = room_speed * 2;
	draw_message_reset = 1;	
}

if (draw_message_reset == 1) {
	if (global.game_message != message_last){
		if (global.game_message != ""){
			alarm[0] = -1;
			draw_message = true;
			draw_message_reset = 0;
		}
	}
}

if (draw_message_reset == 0) {
	if (global.game_message != ""){
		alarm[0] = -1;
		draw_message = true;
		draw_message_reset = 0;
	}
}

//+
draw_text_color(
	width_20,
	health_bar_height,
	cross_icon,
	HUD_TEXTCOLOR_BRIGHT_GREEN,
	HUD_TEXTCOLOR_BRIGHT_GREEN,
	HUD_TEXTCOLOR_DARK_GREEN,
	HUD_TEXTCOLOR_DARK_GREEN,
	global.HUD_ALPHA
);

//health
draw_text_color(
	width_20+string_width(cross_icon),
	health_bar_height,
	health_perc,
	HUD_TEXTCOLOR_BRIGHT_RED,
	HUD_TEXTCOLOR_BRIGHT_RED,
	HUD_TEXTCOLOR_DARK_RED,
	HUD_TEXTCOLOR_DARK_RED,
	global.HUD_ALPHA
);

var orng_mana_perc = floor(percent_of(global.Player_Mana_orng, global.Player_MAX_Mana));
var blue_mana_perc = floor(percent_of(global.Player_Mana_blue, global.Player_MAX_Mana));
var purp_mana_perc = floor(percent_of(global.Player_Mana_purp, global.Player_MAX_Mana));
var green_mana_perc = floor(percent_of(global.Player_Mana_green, global.Player_MAX_Mana));


switch(global.player_weapon_selected){
	default:
	case WEAPON_LIST.HAND_1:{
		var selected_mana = global.Player_Mana_orng;
		var fire_o_meter_sprite = spr_hud_fire_orgn;
		var mana_perc = "M"+string(orng_mana_perc)+"%";
		var mana_color = HUD_TEXTCOLOR_BRIGHT_ORNG;
		var mana_color_dark = HUD_TEXTCOLOR_DARK_ORNG;
	}break;
	
	case WEAPON_LIST.HAND_2:{
		var selected_mana = global.Player_Mana_blue;
		var fire_o_meter_sprite = spr_hud_fire_blue;
		var mana_perc = "M"+string(blue_mana_perc)+"%";
		var mana_color = HUD_TEXTCOLOR_BRIGHT_BLUE;
		var mana_color_dark = HUD_TEXTCOLOR_DARK_BLUE;
	}break;
	
	case WEAPON_LIST.HAND_3:{
		var selected_mana = global.Player_Mana_purp;
		var fire_o_meter_sprite = spr_hud_fire_purp;
		var mana_perc = "M"+string(purp_mana_perc)+"%";
		var mana_color = HUD_TEXTCOLOR_BRIGHT_PURP;
		var mana_color_dark = HUD_TEXTCOLOR_DARK_PURP;
	}break;
	
	case WEAPON_LIST.HAND_4:{
		var selected_mana = global.Player_Mana_green;
		var fire_o_meter_sprite = spr_hud_fire_green;
		var mana_perc = "M"+string(green_mana_perc)+"%";
		var mana_color = HUD_TEXTCOLOR_BRIGHT_GREEN;
		var mana_color_dark = HUD_TEXTCOLOR_DARK_GREEN;
	}break;
}


//fire_o_meter
draw_sprite_ext(
	fire_o_meter_sprite,
	0,
	display_width - 160,
	display_height - 192,
	2,
	2,
	0,
	c_white,
	1
);

var fire_chicken_o_meter_height =  79 - ( (percent_of(selected_mana, global.Player_MAX_Mana) / 100) * 79 );

draw_sprite_part_ext(
	fire_o_meter_sprite,
	1,
	0,
	0,
	48,
	fire_chicken_o_meter_height,
	display_width - 160,
	display_height - 192,
	2,
	2,
	c_white,
	1
);

//Mana
draw_text_color(
	width_20,
	health_bar_height+40,
	mana_perc,
	mana_color,
	mana_color,
	mana_color_dark,
	mana_color_dark,
	global.HUD_ALPHA
);

draw_set_font(-1);