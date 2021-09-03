var length = array_length(global.walls_array);

for (var i = 0; i > length; ++i){
	var door_id = global.walls_array[i];
	
	if (door_id == id){
		array_delete(global.walls_array,i,1);	
	}
}

vertex_delete_buffer(wall_north);
vertex_delete_buffer(wall_south);
vertex_delete_buffer(wall_west);
vertex_delete_buffer(wall_east);