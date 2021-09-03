z = CELLSCALE32+1;

var color = c_white;
var scale = CELLSCALE32;
var size = CELLSCALE32;

image_xscale = 1;
image_yscale = 1;

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


//collision
shape = NewColAABBFromMinMax(new Vector3(self.x, self.y, 0), new Vector3(self.x + (32 * image_xscale), self.y + (32 * image_yscale), 65));
shape.position.z = z;

//door stuff
start_z = z;
z_max = z + 32;

switch_flipped = false;

trigger_shape = NewColAABBFromMinMax(new Vector3(self.x - 8, self.y - 8, 0), new Vector3(self.x + (32 * image_xscale) + 8, self.y + (32 * image_yscale) + 8, 32));

//collision check array
global.walls_array[global.walls_array_index] = id;
global.walls_array_index += 1;

object_is_audioemitter(snd_sfx_switch,false,1,0,200,100);