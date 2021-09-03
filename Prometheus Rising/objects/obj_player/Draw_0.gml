//dont_draw_self();

if (global.debug_draw_3d_hitbox){
	var model_width = 8 / 2;
	var model_length = 8 / 2;

	matrix_set(matrix_world, matrix_build(x - model_width, y - model_length, z, 0, 0, 0, 1, 1, 1));
	vertex_submit(model_player_colbox, pr_trianglelist, -1);
	matrix_set(matrix_world, global.matrixbuild_identity);
}