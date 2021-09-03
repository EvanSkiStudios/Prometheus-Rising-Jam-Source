z = 0;

texture = sprite_get_texture(spr_tex_door,door_is_locked);


start_z = z;
z_max = z + 32;

door_speed = 1;
door_opening = false;

//collision
trigger_shape = NewColAABBFromMinMax(new Vector3(self.x, self.y, 0), new Vector3(self.x + (32 * image_xscale), self.y + (32 * image_yscale), 32));
shape = NewColAABBFromMinMax(new Vector3(self.x, self.y + 8, z), new Vector3(self.x + 32, self.y + (32 - 8), 32));

//collision check array
global.doors_array[global.doors_array_index] = id;
global.doors_array_index += 1;

object_is_audioemitter(snd_sfx_door,false,1,0,200,50);