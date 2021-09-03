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
