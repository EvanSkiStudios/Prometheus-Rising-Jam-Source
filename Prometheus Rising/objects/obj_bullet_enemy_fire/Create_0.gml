z = depth;

//audio
object_is_audioemitter(snd_sfx_wep_cast_fire, false, 1, z, 200, 100);

//collision
shape = NewColAABBFromMinMax(new Vector3(self.x - 2 , self.y - 2, self.z - 8), new Vector3(self.x + 2, self.y + 2, self.z + 8));