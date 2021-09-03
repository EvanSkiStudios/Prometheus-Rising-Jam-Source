exit;

//converting obj and such to buffer for faster loading
var vertex_data = buffer_create_from_vertex_buffer(player_colbox, buffer_fixed, 1);
var filename = get_save_filename("Evanski 3D Model|*E3D", ".E3D");
buffer_save(vertex_data, filename);

buffer_delete(vertex_data);