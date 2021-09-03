if !(door_opening) && (z != start_z) && !((obj_player.shape.CheckAABB(trigger_shape))){
	door_opening = false;
	//if !audio_is_playing(snd_door){
	//	audio_play_sound(snd_door,1,false);
	//}
	object_audioemitter_play();
	z -= door_speed;
	//update collision data
	//shape.position.z = z;
	alarm[0] = 1;
}else{
	door_opening = false;
	alarm[0] = GAME_SPEED;	
}