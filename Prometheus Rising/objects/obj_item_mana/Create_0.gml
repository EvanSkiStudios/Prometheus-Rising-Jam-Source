z = 3;

image_speed = 0.2;
image_xscale = 0.5;
image_yscale = 0.5;


//collision
shape = NewColAABBFromMinMax( new Vector3(self.x-8, self.y-8, self.z-8), new Vector3(self.x +8, self.y +8, self.z +8));

switch(mana_type){
	default:
	case 0:{
		sprite_index = spr_item_mana_orgn;
	}break;
	
	case 1:{
		sprite_index = spr_item_mana_blue;
	}break;
	
	case 2:{
		sprite_index = spr_item_mana_purp;
	}break;
	
	case 3:{
		sprite_index = spr_item_mana_green;
	}break;
}

alarm[0] = 1;

if (mana_multiplyer <= 0) mana_multiplyer = 1;