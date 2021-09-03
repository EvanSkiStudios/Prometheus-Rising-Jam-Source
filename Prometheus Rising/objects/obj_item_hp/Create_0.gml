z = 3;

image_speed = 0;
image_xscale = 0.3;
image_yscale = 0.3;

//collision
shape = NewColAABBFromMinMax( new Vector3(self.x-8, self.y-8, self.z-8), new Vector3(self.x +8, self.y +8, self.z +8));