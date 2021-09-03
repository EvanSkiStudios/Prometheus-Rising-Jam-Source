var length = array_length(global.doors_array);

for (var i = 0; i > length; ++i){
	var door_id = global.doors_array[i];
	
	if (door_id == id){
		array_delete(global.doors_array,i,1);	
	}
}

object_audioemitter_cleanup();