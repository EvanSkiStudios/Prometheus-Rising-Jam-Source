alpha = clamp(alpha + (fade * 0.02), 0, 1);

if (alpha == 1){
		//goto_next
		audio_stop_all();
		room_goto(rm_main);
	fade = -1;
}

if (alpha == 0) && (fade == -1){
	instance_destroy();	
}


draw_set_alpha(alpha);

draw_rectangle_color(
	display_width - display_width,
	display_height - display_height,
	display_width,
	display_height,
	c_black,
	c_black,
	c_black,
	c_black,
	false
);

draw_set_alpha(1);