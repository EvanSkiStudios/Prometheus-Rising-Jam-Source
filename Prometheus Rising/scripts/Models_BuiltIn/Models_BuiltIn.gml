function Model_Floor(){
	world_floor = vertex_create_buffer();
	vertex_begin(world_floor, vertex_format);

	var size = CELLSCALE32;
	for (var i = 0; i < room_width; i += size;){
		for (var j = 0; j < room_height; j += size;){
			
			/*
			if ((i % (size * 2) == 0 && j % (size * 2) == 0) || (i % (size * 2) > 0 && j % (size * 2) > 0)){
				var color = make_color_rgb(113,113,113);
			}else{
				var color = make_color_rgb(56,56,56);
			}
			*/
			var color = c_white;
			
		
			vertex_add_point(world_floor, i, j, 0,						0, 0, 1,		0, 0,		color, 1);
			vertex_add_point(world_floor, i + size, j, 0,				0, 0, 1,		1, 0,		color, 1);
			vertex_add_point(world_floor, i + size, j + size, 0,		0, 0, 1,		1, 1,		color, 1);

			vertex_add_point(world_floor, i + size, j + size, 0,		0, 0, 1,		1, 1,		color, 1);
			vertex_add_point(world_floor, i, j + size, 0,				0, 0, 1,		0, 1,		color, 1);
			vertex_add_point(world_floor, i, j, 0,						0, 0, 1,		0, 0,		color, 1);
		}
	}
	vertex_end(world_floor);
	vertex_freeze(world_floor);
	
	return world_floor;
}

function Model_Celing(){
	world_celing = vertex_create_buffer();
	vertex_begin(world_celing, vertex_format);
	var size = CELLSCALE32;
	for (var i = 0; i < room_width; i += size;){
		for (var j = 0; j < room_height; j += size;){
		
			var color = make_color_rgb(56,56,56);
		
			vertex_add_point(world_celing, i, j, 0,						0, 0, 1,		0, 0,		color, 1);
			vertex_add_point(world_celing, i + size, j, 0,				0, 0, 1,		1, 0,		color, 1);
			vertex_add_point(world_celing, i + size, j + size, 0,			0, 0, 1,		1, 1,		color, 1);

			vertex_add_point(world_celing, i + size, j + size, 0,			0, 0, 1,		1, 1,		color, 1);
			vertex_add_point(world_celing, i, j + size, 0,				0, 0, 1,		0, 1,		color, 1);
			vertex_add_point(world_celing, i, j, 0,						0, 0, 1,		0, 0,		color, 1);
		}
	}
	vertex_end(world_celing);
	vertex_freeze(world_celing);
	
	return world_celing;
}