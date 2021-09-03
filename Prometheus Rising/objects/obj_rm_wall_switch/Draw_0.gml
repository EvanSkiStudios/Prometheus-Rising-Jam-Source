switch(Switch_direction){

	default:
	case 0:{
		north_tex = sprite_get_texture(switch_image, switch_image_num);
		
		south_tex = sprite_get_texture(other_walls_tex, other_walls_tex_num);
		west_tex = south_tex;
		east_tex = west_tex;
	}break;
	
	case 1:{
		east_tex = sprite_get_texture(switch_image, switch_image_num);
		
		north_tex = sprite_get_texture(other_walls_tex, other_walls_tex_num);
		south_tex = north_tex;
		west_tex = south_tex;
	}break;
	
	case 2:{
		south_tex = sprite_get_texture(switch_image, switch_image_num);
		
		north_tex = sprite_get_texture(other_walls_tex, other_walls_tex_num);
		west_tex = north_tex;
		east_tex = west_tex;
	}break;
	
	case 3:{
		west_tex = sprite_get_texture(switch_image, switch_image_num);
		
		north_tex = sprite_get_texture(other_walls_tex, other_walls_tex_num);
		south_tex = north_tex;
		east_tex = south_tex;
	}break;

}


//Wall North
wall_north_matrix = matrix_build(fixed_x, y, shape.position.z, 90, 180, 0, 1, 1, 1);
matrix_set(matrix_world, wall_north_matrix);
vertex_submit(wall_north, pr_trianglelist, north_tex);


//Wall South
wall_south_matrix = matrix_build(x, fixed_y, shape.position.z, 90, 0, 0, 1, 1, 1);
matrix_set(matrix_world, wall_south_matrix);
vertex_submit(wall_south, pr_trianglelist, south_tex);


//Wall West
wall_west_matrix = matrix_build(x, y, shape.position.z, 90, 90, 0, 1, 1, 1);
matrix_set(matrix_world, wall_west_matrix);
vertex_submit(wall_west, pr_trianglelist, west_tex);


//Wall East
wall_east_matrix = matrix_build(fixed_x, fixed_y, shape.position.z, 90, 270, 0, 1, 1, 1);
matrix_set(matrix_world, wall_east_matrix);
vertex_submit(wall_east, pr_trianglelist, east_tex);

//reset the matrix
matrix_set(matrix_world, global.matrixbuild_identity);