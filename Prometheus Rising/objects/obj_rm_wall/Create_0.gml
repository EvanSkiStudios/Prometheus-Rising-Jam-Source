z = CELLSCALE32+1;

var color = c_white;
var scale = CELLSCALE32;
var size = CELLSCALE32;

var scale_diff = (scale / size);

var vformat = global.vertex_format;

#region Wall North
	wall_north = vertex_create_buffer();
	vertex_begin(wall_north, vformat);

	wall_length = (image_xscale * scale) / scale_diff;

	for (var i = 0; i < wall_length; i += scale;){
		vertex_add_point(wall_north, i, 1, 0,						0, 0, 1,		0, 0,		color, 1);
		vertex_add_point(wall_north, i + scale, 1, 0,				0, 0, 1,		1, 0,		color, 1);
		vertex_add_point(wall_north, i + scale, 1 + scale, 0,		0, 0, 1,		1, 1,		color, 1);

		vertex_add_point(wall_north, i + scale, 1 + scale, 0,		0, 0, 1,		1, 1,		color, 1);
		vertex_add_point(wall_north, i, 1 + scale, 0,				0, 0, 1,		0, 1,		color, 1);
		vertex_add_point(wall_north, i, 1, 0,						0, 0, 1,		0, 0,		color, 1);
	}

	vertex_end(wall_north);
	vertex_freeze(wall_north);
#endregion
fixed_x = x + (CELLSCALE32 * image_xscale);
wall_north_matrix = matrix_build(fixed_x, y, z, 90, 180, 0, 1, 1, 1);


#region Wall South
	wall_south = vertex_create_buffer();
	vertex_begin(wall_south, vformat);

	wall_length = (image_xscale * scale) / scale_diff;

	for (var i = 0; i < wall_length; i += scale;){

		vertex_add_point(wall_south, i, 1, 0,						0, 0, 1,		0, 0,		color, 1);
		vertex_add_point(wall_south, i + scale, 1, 0,				0, 0, 1,		1, 0,		color, 1);
		vertex_add_point(wall_south, i + scale, 1 + scale, 0,		0, 0, 1,		1, 1,		color, 1);

		vertex_add_point(wall_south, i + scale, 1 + scale, 0,		0, 0, 1,		1, 1,		color, 1);
		vertex_add_point(wall_south, i, 1 + scale, 0,				0, 0, 1,		0, 1,		color, 1);
		vertex_add_point(wall_south, i, 1, 0,						0, 0, 1,		0, 0,		color, 1);
	}

	vertex_end(wall_south);
	vertex_freeze(wall_south);
#endregion
fixed_y = y + (CELLSCALE32 * image_yscale);
wall_south_matrix = matrix_build(x, fixed_y, z, 90, 0, 0, 1, 1, 1);


#region Wall West
	wall_west = vertex_create_buffer();
	vertex_begin(wall_west, vformat);

	wall_length = (image_yscale * scale) / scale_diff;

	for (var i = 0; i < wall_length; i += scale;){

		vertex_add_point(wall_west, i, 1, 0,						0, 0, 1,		0, 0,		color, 1);
		vertex_add_point(wall_west, i + scale, 1, 0,				0, 0, 1,		1, 0,		color, 1);
		vertex_add_point(wall_west, i + scale, 1 + scale, 0,		0, 0, 1,		1, 1,		color, 1);

		vertex_add_point(wall_west, i + scale, 1 + scale, 0,		0, 0, 1,		1, 1,		color, 1);
		vertex_add_point(wall_west, i, 1 + scale, 0,				0, 0, 1,		0, 1,		color, 1);
		vertex_add_point(wall_west, i, 1, 0,						0, 0, 1,		0, 0,		color, 1);
	}

	vertex_end(wall_west);
	vertex_freeze(wall_west);
#endregion
wall_west_matrix = matrix_build(x, y, z, 90, 90, 0, 1, 1, 1);


#region Wall East
	wall_east = vertex_create_buffer();
	vertex_begin(wall_east, vformat);

	wall_length = (image_yscale * scale) / scale_diff;

	for (var i = 0; i < wall_length; i += scale;){

		vertex_add_point(wall_east, i, 1, 0,						0, 0, 1,		0, 0,		color, 1);
		vertex_add_point(wall_east, i + scale, 1, 0,				0, 0, 1,		1, 0,		color, 1);
		vertex_add_point(wall_east, i + scale, 1 + scale, 0,		0, 0, 1,		1, 1,		color, 1);

		vertex_add_point(wall_east, i + scale, 1 + scale, 0,		0, 0, 1,		1, 1,		color, 1);
		vertex_add_point(wall_east, i, 1 + scale, 0,				0, 0, 1,		0, 1,		color, 1);
		vertex_add_point(wall_east, i, 1, 0,						0, 0, 1,		0, 0,		color, 1);
	}

	vertex_end(wall_east);
	vertex_freeze(wall_east);
#endregion
fixed_x = x + (CELLSCALE32 * image_xscale);
fixed_y = y + (CELLSCALE32 * image_yscale);
wall_east_matrix = matrix_build(fixed_x, fixed_y, z, 90, 270, 0, 1, 1, 1);


//collision
//shape = NewColAABBFromMinMax(new Vector3(self.x - 1, self.y - 1, 0), new Vector3(self.x + (33 * image_xscale), self.y + (33 * image_yscale), 33));
shape = NewColAABBFromMinMax(new Vector3(self.x, self.y, 0), new Vector3(self.x + (32 * image_xscale), self.y + (32 * image_yscale), 32));

//collision check array
global.walls_array[global.walls_array_index] = id;
global.walls_array_index += 1;