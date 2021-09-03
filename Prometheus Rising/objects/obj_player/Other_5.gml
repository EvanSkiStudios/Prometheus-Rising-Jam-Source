for (var i = 0; i < (array_length(global.enemy_array) - 1); i++;){
	array_delete(global.enemy_array,i,1)
}

for (var i = 0; i < (array_length(global.walls_array) - 1); i++;){
	array_delete(global.walls_array,i,1)
}

for (var i = 0; i < (array_length(global.doors_array) - 1); i++;){
	array_delete(global.doors_array,i,1)
}

//walls
global.walls_array_index = 0;
global.walls_array[global.walls_array_index] = noone;

//doors
global.doors_array_index = 0;
global.doors_array[global.doors_array_index] = noone;

//enemies
global.enemy_array_index = 0;
global.enemy_array[global.enemy_array_index] = noone;