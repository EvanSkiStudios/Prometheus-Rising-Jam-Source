//door stuff
z = clamp(z, start_z, z_max);

//check for collision
var player = obj_player;

if (keyboard_check(vk_space)) && (player.shape.CheckAABB(trigger_shape)){
		if !(door_opening){
			alarm[1] = 1;
			audio_play_sound(snd_sfx_door,1,false);
			door_opening = true;
		}
		alarm[0] = GAME_SPEED * 1.5;
}

//update collision data
shape.position.z = z;