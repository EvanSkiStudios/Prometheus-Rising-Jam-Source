matrix_set(matrix_world, matrix_build(x, y, z, 0, 0, 0, 1, 1, 1));
vertex_submit(door_model, pr_trianglelist, texture);
matrix_set(matrix_world, global.matrixbuild_identity);