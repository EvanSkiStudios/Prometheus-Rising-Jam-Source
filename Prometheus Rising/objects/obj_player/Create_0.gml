PlayerHotkeys();

Reset_player_stats();
wait_for_reset = true;

hp_last = global.Player_Health;

allow_regen = global.Player_can_Regen_Health;

z = 0;
display_z = z + CELLSCALE32/2;
zspeed = 0;
look_sensitvity = global.look_sensitvity;

//6.50 is the left over ammount for some reason so remove it
look_dir = ( (window_mouse_get_x() - window_get_width() /2) / look_sensitvity);
direction = look_dir;

look_dir = start_look_direction;
look_pitch = -0;

play_death_sound = true;

move_speed = 2;

//weapon
selected_weapon = 1;

//collision
shape = NewColAABBFromMinMax(new Vector3(self.x - 4, self.y - 4, z), new Vector3(self.x + 4, self.y + 4, display_z));

//audio
audio_listener_orientation(0, 1, 0, 0, 0, 1);

//gui
instance_create_depth(0,0,0,obj_player_gui);
instance_create_depth(0,0,0,obj_player_gui_weapon);