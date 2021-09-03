function draw_sprite_billboard(sprite, subimage, xx, yy, zz, xscale, yscale, rot, col, apl){
	gpu_set_cullmode(cull_noculling);
	shader_set(shd_billboard);
	var matrix = matrix_build(xx, yy, zz, 0, 180, 0, 1, 1, 1);
	matrix_set(matrix_world, matrix);
	draw_sprite_ext(sprite, subimage, 0, 0, xscale, yscale, rot, col, apl);
	matrix_set(matrix_world, global.matrixbuild_identity);
	shader_reset();
	gpu_set_cullmode(cull_counterclockwise);
}

function perform_draw(obj, guievent){
	with(obj){
		event_perform(ev_draw,guievent);	
	}
}

function perform_billboard_draw(obj, guievent){
	with(obj){
		draw_sprite_billboard(sprite_index, image_index, x, y, z, image_xscale, image_yscale, image_angle, c_white, image_alpha);	
	}
}

function Draw_things(){
	
	//Draw Models
	perform_draw(obj_ctrl_model_loader, 0);
	
	//draw billboards
	
	//items
	perform_billboard_draw(obj_item_door_key,0);
	perform_billboard_draw(obj_item_mana,0);
	perform_billboard_draw(obj_item_hp,0);
	
	//enemies
	perform_billboard_draw(obj_enemy_test, 0);
	perform_billboard_draw(obj_enemy_outcast,0)
	perform_billboard_draw(obj_enemy_outcast_noAI,0)
	perform_billboard_draw(obj_enemy_outcast_dead,0);
	perform_billboard_draw(obj_enemy_bmonkey,0)
	perform_billboard_draw(obj_enemy_bmonkey_dead,0);
	perform_billboard_draw(obj_enemy_wargrin,0)
	perform_billboard_draw(obj_enemy_wargrin_dead,0);
	perform_billboard_draw(obj_enemy_hindring,0)
	perform_billboard_draw(obj_enemy_hindring_dead,0);
	perform_billboard_draw(obj_enemy_harubus,0)
	perform_billboard_draw(obj_enemy_harubus_dead,0);
	
	//world objects
	perform_billboard_draw(obj_animation_test, 0);
	perform_billboard_draw(obj_chair, 0);
	
	//draw transparancy last
	//effects
	perform_billboard_draw(obj_bullet_enemy_fire,0);
	perform_billboard_draw(obj_bullet_enemy_harubus,0);
	perform_billboard_draw(obj_bullet_fire,0);
	perform_billboard_draw(obj_bullet_fire_giant,0);
}

function draw_set_default(){
	///@desc Sets all Draw options to there default states.

	draw_set_alpha(1);
	draw_set_circle_precision(24);
	draw_set_color(c_black);
	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_lighting(false);
	draw_set_valign(fa_top);
}