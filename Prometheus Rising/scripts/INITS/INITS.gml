gml_pragma("PNGCrush");
randomize();

//because room_speed is a no no :(
#macro GAME_SPEED game_get_speed(gamespeed_fps)

//FONTS
var quote = ("\"");
var map_string = (" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-+/"+quote+"':;?><,|");
//global.font_Doom_small = font_add_sprite_ext(spr_fnt_doom_small, map_string, false, 0);
global.font_Doom_small = font_add_sprite_ext(spr_fnt_doom_small, map_string, false, 1);
global.font_Doom_big = font_add_sprite_ext(spr_fnt_doom_big, map_string, false, 2);

//tile scale
#macro CELLSCALE32 32

//debug
global.matrixbuild_identity = matrix_build_identity();
global.debug_draw_3d_hitbox = false;
global.player_allow_viewpitch = false;
global.game_noclip = false;

//Settings
global.Show_HUD = true;
global.HUD_ALPHA = 1.0;
global.lock_mouse = true;
global.game_fov = 60;
global.Camera_view_firstperson = true;
global.allow_view_bob = true;
global.display_crosshair = false;
global.look_sensitvity = 7;

//Player settings
function Reset_player_stats(){
	global.Player_is_alive = true;	
	global.Player_MAX_Health = 100;
	global.Player_Health = global.Player_MAX_Health;
	
	global.Player_can_Regen_Health = true;
	global.Difficulty_allow_weapon_sway = true;
	
	global.Player_MAX_Mana = 100;
	
	global.Player_Mana_orng = global.Player_MAX_Mana;
	global.Player_Mana_green = 0;
	global.Player_Mana_blue = 0;
	global.Player_Mana_purp = 0;
	global.Player_weapon_canswitch = true;
	
	global.Player_item_red_key = false;
	global.Player_item_blue_key = false;
	global.Player_item_yellow_key = false;
	global.Player_item_green_key = false;
	
	global.Player_can_move = true;
	global.Player_can_take_damage = true;
}


//GAME SETUP
#macro HUD_TEXTCOLOR_BRIGHT_RED		 c_red
#macro HUD_TEXTCOLOR_DARK_RED		 make_color_rgb(176,37,37)

#macro HUD_TEXTCOLOR_BRIGHT_ORNG	 make_color_rgb(255,183,0)
#macro HUD_TEXTCOLOR_DARK_ORNG		 make_color_rgb(121,97,36)

#macro HUD_TEXTCOLOR_BRIGHT_GREEN	 c_lime
#macro HUD_TEXTCOLOR_DARK_GREEN		 make_color_rgb(37,176,37)

#macro HUD_TEXTCOLOR_BRIGHT_BLUE	 make_color_rgb(29,44,248)
#macro HUD_TEXTCOLOR_DARK_BLUE		 make_color_rgb(37,37,176)

#macro HUD_TEXTCOLOR_BRIGHT_PURP	 make_color_rgb(221,11,180)
#macro HUD_TEXTCOLOR_DARK_PURP		 make_color_rgb(103,33,90)

global.game_message = "";

//weapon
enum WEAPON_LIST{
	HAND_1 = spr_wep_hand_fire_1,	
	HAND_2 = spr_wep_hand_fire_2,
	HAND_3 = spr_wep_hand_fire_3,
	HAND_4 = spr_wep_hand_fire_4
}

global.player_weapon_selected = WEAPON_LIST.HAND_1; 

//walls
global.walls_array_index = 0;
global.walls_array[global.walls_array_index] = noone;

//doors
global.doors_array_index = 0;
global.doors_array[global.doors_array_index] = noone;

//enemies
global.enemy_array_index = 0;
global.enemy_array[global.enemy_array_index] = noone;