if instance_exists(obj_ctrl_fade) exit;

PlayerHotkeys();

global.game_pause = true;
global.Player_can_move = false;
global.Player_can_take_damage = false;

depth = -9999;

menu_width = display_get_gui_width();
menu_height = display_get_gui_height();


enum menu_page{
	main,
	settings,
	audio,
	controls,
	height
}

enum menu_element_type{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

//CREATE MENU PAGES
if (room == rm_main){
	var play_game = "Start Game";	
}else{
	var play_game = "Resume";	
}

ds_menu_main = create_menu_page(
	[play_game,		menu_element_type.script_runner,	resume_game],
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],
	["EXIT",		menu_element_type.script_runner,	exit_game]
);

ds_menu_settings = create_menu_page(
	["DIFFICULTY",	menu_element_type.shift,	change_difficulty, 0, ["MomSaysItsMyTurn", "Be Gentle", "Normal", "Bring the Pain", "NIGHTMARE"]],
	["VIEW BOB",	menu_element_type.toggle,	change_viewbob, global.allow_view_bob, ["ON","OFF"]],
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls],
	["BACK",		menu_element_type.page_transfer,	menu_page.main]
);

ds_menu_audio = create_menu_page(
	["MASTER",			menu_element_type.slider,	change_volume, 1, [0,1]],
	["SOUND EFFECTS",	menu_element_type.slider,	change_volume, 1, [0,1]],
	["MUSIC",			menu_element_type.slider,	change_volume, 1, [0,1]],
	["BACK",			menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_controls = create_menu_page(
	["FULLSCREEN",	menu_element_type.input, "Player_Button_Fullscreen",	global.Player_Button_Fullscreen],
	["MOUSE LOCK",  menu_element_type.input, "Player_Button_mouse_lock",	global.Player_Button_mouse_lock],
	["MOVE UP",		menu_element_type.input, "Player_Button_Move_UP",		global.Player_Button_Move_UP],
	["MOVE LEFT",	menu_element_type.input, "Player_Button_Move_LEFT",		global.Player_Button_Move_LEFT],
	["MOVE DOWN",	menu_element_type.input, "Player_Button_Move_DOWN",		global.Player_Button_Move_DOWN],
	["MOVE RIGHT",  menu_element_type.input, "Player_Button_Move_RIGHT",	global.Player_Button_Move_RIGHT],
	["SHOOT",		menu_element_type.input, "Player_Button_Shoot",			global.Player_Button_Shoot],
	["USE",			menu_element_type.input, "Player_Button_USE",			global.Player_Button_USE],
	["SPRINT",		menu_element_type.input, "Player_Button_Sprint",		global.Player_Button_Sprint],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

page = 0;
//has to be in same order as page enum
menu_pages = [ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_controls];

var i = 0, array_len = array_length(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	++i;
}

inputting = false;