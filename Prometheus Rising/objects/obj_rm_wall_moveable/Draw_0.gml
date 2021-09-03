var North_Texture = SET_ALL_TEXTURE;
var South_Texture = SET_ALL_TEXTURE;
var West_Texture = SET_ALL_TEXTURE;
var East_Texture = SET_ALL_TEXTURE;

var North_Subimg = SET_ALL_TEXTURE_NUM;
var South_Subimg = SET_ALL_TEXTURE_NUM;
var West_Subimg = SET_ALL_TEXTURE_NUM;
var East_Subimg = SET_ALL_TEXTURE_NUM;



//Wall North
var tex = sprite_get_texture(North_Texture, North_Subimg);
wall_north_matrix = matrix_build(fixed_x, y, shape.position.z, 90, 180, 0, 1, 1, 1);
matrix_set(matrix_world, wall_north_matrix);
vertex_submit(wall_north, pr_trianglelist, tex);


//Wall South
var tex = sprite_get_texture(South_Texture, South_Subimg);
wall_south_matrix = matrix_build(x, fixed_y, shape.position.z, 90, 0, 0, 1, 1, 1);
matrix_set(matrix_world, wall_south_matrix);
vertex_submit(wall_south, pr_trianglelist, tex);


//Wall West
var tex = sprite_get_texture(West_Texture, West_Subimg);
wall_west_matrix = matrix_build(x, y, shape.position.z, 90, 90, 0, 1, 1, 1);
matrix_set(matrix_world, wall_west_matrix);
vertex_submit(wall_west, pr_trianglelist, tex);


//Wall East
var tex = sprite_get_texture(East_Texture, East_Subimg);
wall_east_matrix = matrix_build(fixed_x, fixed_y, shape.position.z, 90, 270, 0, 1, 1, 1);
matrix_set(matrix_world, wall_east_matrix);
vertex_submit(wall_east, pr_trianglelist, tex);

//reset the matrix
matrix_set(matrix_world, global.matrixbuild_identity);