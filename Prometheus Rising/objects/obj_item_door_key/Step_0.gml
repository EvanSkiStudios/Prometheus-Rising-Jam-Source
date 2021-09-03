if (obj_player.shape.CheckAABB(shape)){
	switch(key_type){
		default:
		case 0:{
			global.Player_item_blue_key = true;
			global.game_message = "You picked up BLUE KEY!";
			instance_destroy();
		}break;
		
		case 1:{
			global.Player_item_red_key = true;
			global.game_message = "You picked up RED KEY!";
			instance_destroy();
		}break;
		
		case 2:{
			global.Player_item_yellow_key = true;
			global.game_message = "You picked up YELLOW KEY!";
			instance_destroy();
		}break;
		
	}
}