//DO NOT ADD ASSET LAYERS TO ROOM OR BAD THINGS HAPPEN

//any room with custom size
var _w = 960;
var _h = 540;
window_set_size(_w,_h);
surface_resize(application_surface,_w,_h);
//center_window window_center();
alarm[0] = 1;

//3D draw depth buffer
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_cullmode(cull_counterclockwise);

view_mat = undefined;
proj_mat = undefined;