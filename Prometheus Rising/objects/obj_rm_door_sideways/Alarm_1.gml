var new_z = (z + door_speed);
if (door_opening) && (new_z < z_max){
	door_opening = true;
	//if !audio_is_playing(snd_door){
	//	audio_play_sound(snd_door,1,false);
	//}
	z += door_speed;
	alarm[1] = 1;
}else{
	alarm[0] = GAME_SPEED * 1.5;	
}