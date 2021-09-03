if (
		( keyboard_check_pressed(vk_anykey) ||
		mouse_check_button_pressed(PLAYERBUTTON_SHOOT) ) &&
		!(keyboard_check_pressed(global.Player_Button_mouse_lock)) &&
		!(keyboard_check_pressed(global.Player_Button_Escape))
   ){
	global.Player_Health = global.Player_MAX_Health;
	room_restart();
}
alarm[0] = 1;