if !(door_opening) && (z != start_z) && !((obj_player.shape.CheckAABB(trigger_shape))){
	door_opening = false;
	object_audioemitter_play();
	z -= door_speed;
	alarm[0] = 1;
}else{
	door_opening = false;
	alarm[0] = GAME_SPEED;	
}