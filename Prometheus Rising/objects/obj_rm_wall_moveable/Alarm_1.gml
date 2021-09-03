var new_z = (z + door_speed);
if (door_opening) && (new_z < z_max){
	door_opening = true;
	z += door_speed;
	alarm[1] = 1;
}else{
	alarm[0] = GAME_SPEED * 1.5;	
}