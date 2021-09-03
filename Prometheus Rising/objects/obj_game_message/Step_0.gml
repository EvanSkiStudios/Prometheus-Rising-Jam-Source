if (obj_player.shape.CheckAABB(shape)){
	global.game_message = string(G_message);
	instance_destroy();	
}