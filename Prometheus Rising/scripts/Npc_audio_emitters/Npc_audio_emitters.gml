function object_is_audioemitter(snd_file, loops, priority, Z_pos, max_distance, audio_drops_at){
	
	//referances
	audio_file = snd_file;
	audio_loops = loops;
	audio_priority = priority;
	audio_pos_Z = Z_pos;
	audio_max_distance_to_be_heard = max_distance;
	audio_starts_to_drop_at = audio_drops_at;
	
	//create emitter
	s_emit = audio_emitter_create();

//default values to be over writen
/*
audio_file = snd_error;
audio_loops = false;
audio_priority = 1;
audio_pos_Z = 0;

audio_max_distance_to_be_heard = 300;
audio_starts_to_drop_at = 100;
*/


	//Set the model to falloff based on distance from listener
	audio_falloff_set_model(audio_falloff_linear_distance);
	audio_emitter_position(s_emit, x, y, audio_pos_Z);
	audio_emitter_falloff(s_emit, audio_starts_to_drop_at, audio_max_distance_to_be_heard, 1);


	xPos = x;
	yPos = y;
	zPos = audio_pos_Z;
	velocityMultiplier = 2;
	prevX = x;
	prevY = y;
	prevZ = zPos;

	var xVel = xPos - prevX;
	var yVel = yPos - prevY;
	var zVel = zPos - prevZ;
	prevX = xPos;
	prevY = yPos;
	prevZ = zPos;
	xVel*=velocityMultiplier;
	yVel*=velocityMultiplier;
	zVel*=velocityMultiplier;
	audio_emitter_velocity(s_emit, xVel, yVel, zVel);

	//prevents glitch with audio playing with create event
	state = 0;
}


function object_audioemitter_update(){
	if (state == 0){
		audio_play_sound_on(s_emit, audio_file, audio_loops, audio_priority);
		state = 1;
	}

	//update emiter position
	audio_emitter_position(s_emit, x, y, audio_pos_Z);

	//update emitter velocity
	xPos = x;
	yPos = y;
	zPos = audio_pos_Z;
	velocityMultiplier = 1;

	var xVel = xPos - prevX;
	var yVel = yPos - prevY;
	var zVel = zPos - prevZ;
	prevX = xPos;
	prevY = yPos;
	prevZ = zPos;
	xVel*=velocityMultiplier;
	yVel*=velocityMultiplier;
	zVel*=velocityMultiplier;
	audio_emitter_velocity(s_emit, xVel, yVel, zVel);
}

function object_audioemitter_play(){
	if (state == 0){
		if !audio_is_playing(audio_file){
			audio_play_sound_on(s_emit, audio_file, audio_loops, audio_priority);
		}
		state = 1;
	}
	state = 0;

	//update emiter position
	audio_emitter_position(s_emit, x, y, audio_pos_Z);

	//update emitter velocity
	xPos = x;
	yPos = y;
	zPos = audio_pos_Z;
	velocityMultiplier = 1;

	var xVel = xPos - prevX;
	var yVel = yPos - prevY;
	var zVel = zPos - prevZ;
	prevX = xPos;
	prevY = yPos;
	prevZ = zPos;
	xVel*=velocityMultiplier;
	yVel*=velocityMultiplier;
	zVel*=velocityMultiplier;
	audio_emitter_velocity(s_emit, xVel, yVel, zVel);
}

function object_audioemitter_change(snd_file, loops, priority, Z_pos, max_distance, audio_drops_at){
	//stop old sound
	audio_stop_sound(audio_file);
	
	//referances
	audio_file = snd_file;
	audio_loops = loops;
	audio_priority = priority;
	audio_pos_Z = Z_pos;
	audio_max_distance_to_be_heard = max_distance;
	audio_starts_to_drop_at = audio_drops_at;

//default values to be over writen
/*
audio_file = snd_error;
audio_loops = false;
audio_priority = 1;
audio_pos_Z = 0;

audio_max_distance_to_be_heard = 300;
audio_starts_to_drop_at = 100;
*/


	//Set the model to falloff based on distance from listener
	audio_falloff_set_model(audio_falloff_linear_distance);
	audio_emitter_position(s_emit, x, y, audio_pos_Z);
	audio_emitter_falloff(s_emit, audio_starts_to_drop_at, audio_max_distance_to_be_heard, 1);


	xPos = x;
	yPos = y;
	zPos = audio_pos_Z;
	velocityMultiplier = 2;
	prevX = x;
	prevY = y;
	prevZ = zPos;

	var xVel = xPos - prevX;
	var yVel = yPos - prevY;
	var zVel = zPos - prevZ;
	prevX = xPos;
	prevY = yPos;
	prevZ = zPos;
	xVel*=velocityMultiplier;
	yVel*=velocityMultiplier;
	zVel*=velocityMultiplier;
	audio_emitter_velocity(s_emit, xVel, yVel, zVel);

	//prevents glitch with audio playing with create event
	state = 0;
}


function object_audioemitter_cleanup(){
	//stop old sound
	audio_stop_sound(audio_file);
	
	//prevent memory leak
	audio_emitter_free(s_emit);

	//stop sound
	audio_stop_sound(audio_file);
}