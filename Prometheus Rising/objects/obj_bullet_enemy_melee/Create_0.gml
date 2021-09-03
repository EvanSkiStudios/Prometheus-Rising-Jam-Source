z = depth;

punch_sound = snd_sfx_wep_punch;

//collision
shape = NewColAABBFromMinMax(new Vector3(self.x - 15 , self.y - 15, self.z - 8), new Vector3(self.x + 15, self.y + 15, self.z + 8));

alarm[0] = GAME_SPEED/4;