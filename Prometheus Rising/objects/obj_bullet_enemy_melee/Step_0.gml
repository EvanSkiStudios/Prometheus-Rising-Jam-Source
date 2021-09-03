shape.position.z += 0.01;

#region check walls
	//create local variable for array
	var walls_array = global.walls_array;
	//set veriable to resized array
	var number_of_walls = array_length(walls_array);
	
	//check for collision
	for (var i = 0; i < number_of_walls; ++i){
		var wall = walls_array[i];
		
		//looking to move on the x too
		if (wall.shape.CheckAABB(shape)){
			instance_destroy();
		}
	}
#endregion

#region check doors
	//create local variable for array
	var doors_array = global.doors_array;
	//set veriable to resized array
	var number_of_doors = array_length(doors_array);
	
	//check for collision
	for (var i = 0; i < number_of_doors; ++i){
		var door = doors_array[i];
		
		if (door.shape.position.z >= z) break;
		
			//looking to move on the x too
			if (door.shape.CheckAABB(shape)){
				instance_destroy();				
			}
		}
#endregion


#region check player
		//looking to move on the x too
		if (obj_player.shape.CheckAABB(shape)){
			audio_play_sound(punch_sound,100,false);
			global.Player_Health -= damage;
			instance_destroy();
		}
#endregion

//reset shape position
shape.position.x = x;
shape.position.y = y;


//reset z check
shape.position.z -= 0.01;