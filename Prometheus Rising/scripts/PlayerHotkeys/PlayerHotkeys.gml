function PlayerHotkeys(){
	//debug
	global.Player_Button_noclip = vk_f3;
	global.Player_Button_toggle_pov = vk_f5;
	global.Player_Button_look_pitch = vk_control;
	global.Player_Button_restart = vk_f2;
	global.Player_Button_death = vk_f8;
	
	//temp until menu
	global.Player_Button_Escape = vk_escape;
	global.Player_Button_toggle_viewbob = vk_alt;
	
	//default
	global.Player_Button_USE = vk_space;
	global.Player_Button_Fullscreen = vk_f11;
	global.Player_Button_mouse_lock = vk_tab;
	global.Player_Button_Sprint = vk_shift;
	global.Player_Button_Shoot = mb_left;
	
	global.Player_can_move = true;
	global.Player_can_take_damage = true;
	
	global.Player_Button_Move_UP = ord("W");
	global.Player_Button_Move_LEFT = ord("A");
	global.Player_Button_Move_DOWN = ord("S");
	global.Player_Button_Move_RIGHT = ord("D");
	
	#macro PLAYERBUTTON_NOCLIP	 global.Player_Button_noclip
	#macro PLAYERBUTTON_POV		 global.Player_Button_toggle_pov
	#macro PLAYERBUTTON_PITCH	 global.Player_Button_look_pitch
	#macro PLAYERBUTTON_RESTART	 global.Player_Button_restart
	#macro PLAYERBUTTON_DEATH	 global.Player_Button_death

	#macro PLAYERBUTTON_ESC		global.Player_Button_Escape
	#macro PLAYERBUTTON_VIEWBOB global.Player_Button_toggle_viewbob

	#macro PLAYERBUTTON_FULLSCREEN	global.Player_Button_Fullscreen
	#macro PLAYERBUTTON_MOUSELOCK	global.Player_Button_mouse_lock
	#macro PLAYERBUTTON_SPRINT		global.Player_Button_Sprint
	#macro PLAYERBUTTON_SHOOT		global.Player_Button_Shoot
	
	#macro PLAYERBUTTON_MOVE_UP		global.Player_Button_Move_UP
	#macro PLAYERBUTTON_MOVE_LEFT	global.Player_Button_Move_LEFT 
	#macro PLAYERBUTTON_MOVE_DOWN	global.Player_Button_Move_DOWN 
	#macro PLAYERBUTTON_MOVE_RIGHT	global.Player_Button_Move_RIGHT 
}

function Player_check_keys(){
	//pause
	if (keyboard_check_direct(PLAYERBUTTON_ESC)){
		if !instance_exists(obj_ctrl_MainMenu) && !(instance_exists(obj_ctrl_fade)){
			instance_create_depth(0,0,0,obj_ctrl_MainMenu);	
		}
	}
	
	if (debug_mode){
		//testdeath
		if keyboard_check_pressed(PLAYERBUTTON_DEATH){
			global.Player_Health -= 11;
		}
	
		//restart
		if keyboard_check_released(PLAYERBUTTON_RESTART){
			game_restart();
		}
	
		//toggle noclip
		if keyboard_check_released(PLAYERBUTTON_NOCLIP){
			global.game_noclip = !global.game_noclip;
		}
	
		//toggle pov
		if keyboard_check_released(PLAYERBUTTON_POV){
			global.Camera_view_firstperson = !global.Camera_view_firstperson;
			global.debug_draw_3d_hitbox = !global.debug_draw_3d_hitbox;	
		}
	
			//toggle pitch
		if keyboard_check_released(PLAYERBUTTON_PITCH){
			global.player_allow_viewpitch = !global.player_allow_viewpitch;
		
			if !(global.player_allow_viewpitch){
				look_pitch = -0;	
			}
		}
	}
	
	//sense
	if keyboard_check_released(vk_pagedown){
		global.look_sensitvity += 1;	
	}
	if keyboard_check_released(vk_pageup){
		global.look_sensitvity -= 1;	
	}
	if keyboard_check_released(vk_home){
		global.look_sensitvity = 7;	
	}
	global.look_sensitvity = clamp(global.look_sensitvity,1,10);
	
	
	//fullscreen
	if (keyboard_check_pressed(PLAYERBUTTON_FULLSCREEN)){
		if (window_get_fullscreen()){
			window_set_fullscreen(false);
		}else{
			window_set_fullscreen(true);
		}
	}
	
	//toggle mouse lock
	if keyboard_check_released(PLAYERBUTTON_MOUSELOCK){
		global.lock_mouse = !global.lock_mouse;	
	}
	
	//toggle viewbob
	if keyboard_check_released(PLAYERBUTTON_VIEWBOB){
		global.allow_view_bob = !global.allow_view_bob;	
	}
	
	//run
	if (keyboard_check(PLAYERBUTTON_SPRINT)){
		move_speed = 4;	
	}else{
		move_speed = 2;	
	}
	
	//weapon
	if (global.Player_weapon_canswitch){
		if mouse_wheel_up(){
			selected_weapon += 1;
		
			selected_weapon = clamp(selected_weapon,1,4);
		
			switch(selected_weapon){
				case 1: global.player_weapon_selected = WEAPON_LIST.HAND_1; break;	
				case 2: global.player_weapon_selected = WEAPON_LIST.HAND_2; break;	
				case 3: global.player_weapon_selected = WEAPON_LIST.HAND_3; break;	
				case 4: global.player_weapon_selected = WEAPON_LIST.HAND_4; break;	
			
				default: global.player_weapon_selected = WEAPON_LIST.HAND_1; break;	 
			}
	
		}
	
		if mouse_wheel_down(){
			selected_weapon -= 1;
		
			selected_weapon = clamp(selected_weapon,1,4);
		
			switch(selected_weapon){
				case 1: global.player_weapon_selected = WEAPON_LIST.HAND_1; break;	
				case 2: global.player_weapon_selected = WEAPON_LIST.HAND_2; break;	
				case 3: global.player_weapon_selected = WEAPON_LIST.HAND_3; break;	
				case 4: global.player_weapon_selected = WEAPON_LIST.HAND_4; break;	
			
				default: global.player_weapon_selected = WEAPON_LIST.HAND_1; break;	 
			}
	
		}
	}
}