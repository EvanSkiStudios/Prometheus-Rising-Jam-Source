z = depth;

//audio
audio_play_sound(snd_sfx_wep_bfg_charge,100,false);
object_is_audioemitter(snd_sfx_wep_cast_fire,false, 1, z, 200, 100);
//stats
speed = 0;
image_xscale = 0.1;
image_yscale = 0.1;
full_size_reset = false;

//collision
shape = NewColAABBFromMinMax(new Vector3(self.x - 8 , self.y - 8, self.z - 8), new Vector3(self.x + 8, self.y + 8, self.z + 8));