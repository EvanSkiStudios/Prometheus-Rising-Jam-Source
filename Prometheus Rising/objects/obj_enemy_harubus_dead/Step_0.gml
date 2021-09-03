if (image_index >= image_number - 1){
	image_speed = 0;
	image_index = image_number - 1;
}

if (do_once){
	object_audioemitter_play();
	do_once = false;
}