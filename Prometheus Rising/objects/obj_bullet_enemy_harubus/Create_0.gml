z = depth;

//audio
object_is_audioemitter(snd_sfx_wep_cast_fire, false, 1, z, 200, 100);

//collision
shape = NewColAABBFromMinMax(new Vector3(self.x - 16 , self.y - 16, self.z - 16), new Vector3(self.x + 16, self.y + 16, self.z + 16));