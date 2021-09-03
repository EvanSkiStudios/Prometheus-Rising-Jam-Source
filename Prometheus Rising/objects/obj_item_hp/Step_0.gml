if (obj_player.shape.CheckAABB(shape)){
	global.Player_Health += 20;
	global.game_message = "You picked up HEALTH!";
	instance_destroy();
}