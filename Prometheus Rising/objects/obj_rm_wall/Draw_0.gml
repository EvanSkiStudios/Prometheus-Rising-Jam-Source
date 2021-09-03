if (SET_ALL_TEXTURE != spr_rm_wall){
	North_Texture = SET_ALL_TEXTURE;
	South_Texture = SET_ALL_TEXTURE;
	West_Texture = SET_ALL_TEXTURE;
	East_Texture = SET_ALL_TEXTURE;
}

if (SET_ALL_TEXTURE_NUM != -1){
	North_Subimg = SET_ALL_TEXTURE_NUM;
	South_Subimg = SET_ALL_TEXTURE_NUM;
	West_Subimg = SET_ALL_TEXTURE_NUM;
	East_Subimg = SET_ALL_TEXTURE_NUM;
}


//Wall North
var tex = sprite_get_texture(North_Texture, North_Subimg);
matrix_set(matrix_world, wall_north_matrix);
vertex_submit(wall_north, pr_trianglelist, tex);


//Wall South
var tex = sprite_get_texture(South_Texture, South_Subimg);
matrix_set(matrix_world, wall_south_matrix);
vertex_submit(wall_south, pr_trianglelist, tex);


//Wall West
var tex = sprite_get_texture(West_Texture, West_Subimg);
matrix_set(matrix_world, wall_west_matrix);
vertex_submit(wall_west, pr_trianglelist, tex);


//Wall East
var tex = sprite_get_texture(East_Texture, East_Subimg);
matrix_set(matrix_world, wall_east_matrix);
vertex_submit(wall_east, pr_trianglelist, tex);

//reset the matrix
matrix_set(matrix_world, global.matrixbuild_identity);