//matrix_set(matrix_world, matrix_build(x, y, z, 0, 0, player_direct, 1, 0, 1));

matrix_set(matrix_world, matrix_build(x, y, z, 0, 0, 180, 6, 6, 6));

vertex_submit(model, pr_trianglelist, sprite_get_texture(spr_DeepThought,0));

matrix_set(matrix_world, global.matrixbuild_identity);