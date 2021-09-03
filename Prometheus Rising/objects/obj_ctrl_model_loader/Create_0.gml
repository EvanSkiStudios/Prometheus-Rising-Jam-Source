#region Vertex format setup
//Vertex format: data must go into vertex buffers in the order defined by this
vertex_format_begin();
vertex_format_add_position_3d();	//3 x (32 float) 12bytes
vertex_format_add_normal();			//3 x (32 float) 12bytes 
vertex_format_add_texcoord();		// 2 x (32 float) 8bytes
vertex_format_add_color();			//4 x (8 int)  4bytes
global.vertex_format = vertex_format_end(); //36 bytes
#endregion
vertex_format = global.vertex_format;


//draw floor
world_floor = Model_Floor();
//floor_shape = new ColPlane( new Vector3(0,0,-1), 0);

//draw celing
world_celing = Model_Celing();
Celing_matrix = matrix_build(room_width, 0, CELLSCALE32, 0, 180, 0, 1, 1, 1);


//load models
global.data_model_folder = (working_directory+"data\\models\\");
var md_f = global.data_model_folder;


door = load_E3D(md_f+"door", vertex_format, true);
door_sideways = load_E3D(md_f+"door_sideways", vertex_format, true);

DeepThought = load_E3D(md_f+"deepthought", vertex_format, true);
player_colbox = load_E3D(md_f+"player_colbox", vertex_format, true);



