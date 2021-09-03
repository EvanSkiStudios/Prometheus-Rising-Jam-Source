//draw floor
world_floor = Model_Floor();
//floor_shape = new ColPlane( new Vector3(0,0,-1), 0);


if (room != rm_L4){
	//draw celing
	world_celing = Model_Celing();
	Celing_matrix = matrix_build(room_width, 0, CELLSCALE32, 0, 180, 0, 1, 1, 1);
}