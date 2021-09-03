if (obj_player.shape.CheckAABB(shape)){
	switch(mana_type){
		default:
		case 0:{
			
			if (global.Player_Mana_orng == 0){
				global.player_weapon_selected = WEAPON_LIST.HAND_1;
			}
			
			global.Player_Mana_orng += (5 * mana_multiplyer);
			global.game_message = "You picked up ORANGE MANA!";
			instance_destroy();
		}break;
		
		case 1:{
			
			if (global.Player_Mana_blue == 0){
				global.player_weapon_selected = WEAPON_LIST.HAND_2;
			}
			
			global.Player_Mana_blue += (10 * mana_multiplyer);
			global.game_message = "You picked up BLUE MANA!";
			instance_destroy();
		}break;
		
		case 2:{
			if (global.Player_Mana_purp == 0){
				global.player_weapon_selected = WEAPON_LIST.HAND_3;
			}
			
			
			global.Player_Mana_purp += (20 * mana_multiplyer);
			global.game_message = "You picked up PURPLE MANA!";
			instance_destroy();
		}break;
		
		case 3:{
			if (global.Player_Mana_green == 0){
				global.player_weapon_selected = WEAPON_LIST.HAND_4;
			}
			
			global.Player_Mana_green += (global.Player_MAX_Mana * mana_multiplyer);
			global.game_message = "You picked up GREEN MANA!";
			instance_destroy();
		}break;
		
	}
}