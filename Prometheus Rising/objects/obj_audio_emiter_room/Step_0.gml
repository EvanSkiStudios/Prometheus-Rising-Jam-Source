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