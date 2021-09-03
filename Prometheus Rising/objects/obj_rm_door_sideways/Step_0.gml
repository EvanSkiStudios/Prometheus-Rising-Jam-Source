z = clamp(z,start_z,z_max);
//update collision
shape.position.z = z;

//check for collision
var player = obj_player;


switch(door_is_locked){
	default:
	case 0:{
		Player_has_key = true;	
	}break;
	
	case 1:{
		Player_has_key = (global.Player_item_blue_key);	
		dont_have_key_message = "This Door needs BLUE KEY!";
	}break;
	
	case 2:{
		Player_has_key = (global.Player_item_red_key);
		dont_have_key_message = "This Door needs RED KEY!";
	}break;
	
	case 3:{
		Player_has_key = (global.Player_item_yellow_key);
		dont_have_key_message = "This Door needs YELLOW KEY!";
	}break;
	
	case 4:{
		Player_has_key = (global.Player_item_green_key);
		dont_have_key_message = "";
	}break;
}

if (keyboard_check(global.Player_Button_USE)){
	if (player.shape.CheckAABB(trigger_shape)){
		if (Player_has_key){
			if !(door_opening){
				alarm[1] = 1;
				audio_play_sound(snd_sfx_door,1,false);
				door_opening = true;
			}
			alarm[0] = GAME_SPEED * 1.5;
		}else{
			if !audio_is_playing(snd_sfx_door_locked){
				audio_play_sound(snd_sfx_door_locked, 1, false);	
			}
			global.game_message = dont_have_key_message;
		}
	}
}

//update collision
shape.position.z = z;