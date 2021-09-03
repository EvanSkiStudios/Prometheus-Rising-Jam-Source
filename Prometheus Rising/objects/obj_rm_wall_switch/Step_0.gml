//door stuff
z = clamp(z, start_z, z_max);

//check for collision
var player = obj_player;

if (keyboard_check(vk_space)) && (player.shape.CheckAABB(trigger_shape)){
		if !(switch_flipped){
			alarm[0] = 1.5;
			switch_flipped = true;
		}
		
		alarm[1] = GAME_SPEED / 2;
}

//update collision data
shape.position.z = z;