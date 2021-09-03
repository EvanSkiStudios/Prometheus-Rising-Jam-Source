//clear screen
draw_clear(make_color_rgb(13,13,13));

//then set the fog
shader_set(shd_fog);
var uniform_fog_start = shader_get_uniform(shd_fog, "fogStart");
var uniform_fog_end = shader_get_uniform(shd_fog, "fogEnd");
var uniform_fog_color = shader_get_uniform(shd_fog, "fogColor");

var fogend = 300;
var fogstart = fogend / 2;

var fc_r = 13;
var fc_g = 13;
var fc_b = 13;
var fc_a = 255;

var fogcolor = [fc_r, fc_g, fc_b, fc_a];

shader_set_uniform_f(uniform_fog_start, fogstart);
shader_set_uniform_f(uniform_fog_end, fogend);
shader_set_uniform_f_array(uniform_fog_color, fogcolor);

//get current active camera
var camera = camera_get_active();

//failsafe if for some reason their is no player
if !instance_exists(obj_player){
	instance_create_depth(0,0,0,obj_player);	
}

if (global.Camera_view_firstperson){
	var xfrom = obj_player.x;
	var yfrom = obj_player.y;
	var zfrom = obj_player.display_z;
	var xto = xfrom + dcos(obj_player.look_dir) * dcos(obj_player.look_pitch);
	var yto = yfrom - dsin(obj_player.look_dir) * dcos(obj_player.look_pitch);;
	var zto = zfrom - dsin(obj_player.look_pitch);
}else{
	//Third person camera
	var camera_distance = 48;
	var xto = obj_player.x;
	var yto = obj_player.y;
	var zto = obj_player.display_z;
	var xfrom = xto - camera_distance * dcos(obj_player.look_dir) * dcos(obj_player.look_pitch);
	var yfrom = yto + camera_distance * dsin(obj_player.look_dir) * dcos(obj_player.look_pitch);
	var zfrom = zto + camera_distance * dsin(obj_player.look_pitch);	
}

//lakitu pos, last one being height, lakitu look at, where is up?
view_mat = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0,0,1);
var camera_znear = 1;		//too close to camera to draw
var camera_zfar = fogend;	//too far from camera to draw
proj_mat = matrix_build_projection_perspective_fov(-abs(global.game_fov),-window_get_width() / window_get_height(),camera_znear,camera_zfar);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

//set the camera
camera_apply(camera);

//draw everything
Draw_things();

shader_reset();