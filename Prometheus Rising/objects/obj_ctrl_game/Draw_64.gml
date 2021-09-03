if !(debug_mode) exit;

draw_set_color(c_white);

draw_text(10,30,"fps: "+string(fps) );
//draw_text(10,50,"fps_real: "+string(fps_real));
draw_text(10,50,"x/y/z: "+string(obj_player.x)+ " | " +string(obj_player.y)+ " | " +string(obj_player.z) );
//draw_text(10,90,"dsin/dcos/ "+string(dsin(obj_player.look_dir))+" | "+string(dcos(obj_player.look_dir)) );
draw_text(10,70,"Look_dir: "+string(obj_player.look_dir) );
draw_text(10,90,"Look_pitch: "+string(obj_player.look_pitch) );