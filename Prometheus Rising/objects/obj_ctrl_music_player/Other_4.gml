switch(room){
	default: break;
	
	case rm_main:{
		alarm[0] = GAME_SPEED;	
	}break;
	
	case rm_debug:{
		audio_play_sound(snd_mus_main, 1, true);
	}break;
	
	case rm_L1:{
		audio_play_sound(snd_mus_main, 1, true);	
	}break;
	
	case rm_L2:{
		audio_play_sound(snd_mus_battle_of_acents, 1, true);	
	}break;
	
	case rm_L3:{
		audio_play_sound(snd_mus_game_menu_reprise, 1, true);	
	}break;
	
	case rm_L4:{
		audio_play_sound(snd_mus_bog_creatures, 1, true);		
	}break;
	
	case rm_end:{
		audio_play_sound(snd_mus_game_menu_reprise, 1, true);	
	}break;
	
}