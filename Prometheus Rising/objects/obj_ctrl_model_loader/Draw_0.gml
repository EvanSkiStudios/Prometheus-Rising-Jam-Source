if !(debug_mode){
	//draw floor
	var texture = sprite_get_texture(spr_tex_floor, 0);
	vertex_submit(world_floor, pr_trianglelist, texture);
}

if (room != rm_L4){
	//draw celing
	var texture = sprite_get_texture(spr_tex_celing, 0);
	matrix_set(matrix_world, Celing_matrix);
	vertex_submit(world_celing, pr_trianglelist, texture);
	matrix_set(matrix_world, global.matrixbuild_identity);
}

with(obj_rm_wall){
	event_perform(ev_draw, 0);	
}

with(obj_rm_wall_moveable){
	event_perform(ev_draw, 0);	
}

with(obj_rm_wall_switch){
	event_perform(ev_draw, 0);	
}

with(obj_rm_door){
	door_model = other.door;
	event_perform(ev_draw, 0);	
}

with(obj_rm_door_sideways){
	door_model = other.door_sideways;
	event_perform(ev_draw, 0);	
}

with(obj_player){
	model_player_colbox = other.player_colbox;
	event_perform(ev_draw, 0);	
}

with(obj_deepthought){
	model = other.DeepThought;
	event_perform(ev_draw, 0);	
}