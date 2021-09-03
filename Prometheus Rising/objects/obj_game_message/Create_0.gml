z = 3;

if (G_message == "A"){
	G_message = ("");	
}

//collision
shape = NewColAABBFromMinMax( new Vector3(self.x-8, self.y-8, self.z-8), new Vector3(self.x +8, self.y +8, self.z +8));