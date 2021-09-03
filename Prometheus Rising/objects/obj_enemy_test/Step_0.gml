if (hp <= 0){
	hp = 0;
	enemy_ai_state = ENEMY_AI_STATES.DEATH;
}

if (hp_last > hp){
	object_audioemitter_play();
	hp_last = hp;
}

//AI
Enemy_ai_perform_state(enemy_ai_state);
shape.position.x = x;
shape.position.y = y;
shape.position.z = z;


//DOOM SPRITE
var _player_angle = point_direction(x, y, obj_player.x, obj_player.y);

if (direction != _player_angle){
	var _sprite_angle = direction + angle_difference(direction, _player_angle);
}else{
	//270 because we get 315, which is the desired forward sprite
	var _sprite_angle = direction + (270 - direction);
}

if (_sprite_angle < 0) {
	_sprite_angle = (_sprite_angle mod 360) + 360;
} else {
	if (_sprite_angle > 360) {
		_sprite_angle = _sprite_angle mod 360;
	}
}

//360 degrees, 8 directions
var frame_div = 360 / 8;

sprite_array_index = _sprite_angle div frame_div;

var new_sprite = array_get(sprite_state,sprite_array_index);

//change sprite
if (sprite_index != new_sprite){
	sprite_index = new_sprite;
	
	if (image_index >= image_number){
		image_index = image_number;	
	}
}

//update animation speed
switch(sprite_state){
	default: image_speed = 0; break;
	
	case sprite_walk_dir_array:{
		image_speed = 0.2;	
	}break;
	
	case sprite_attack_ranged_dir_array:{
		if (enemy_can_shoot){
			image_speed = 0.2;
			if (image_index >= image_number -1){
				image_speed = 0;
					//create bullet
					var xx = x + lengthdir_x(3, direction);
					var yy = y + lengthdir_y(3, direction);

					var bullet = instance_create_depth(xx,yy, 16, obj_bullet_enemy_fire);
					bullet.sprite_index = spr_weapon_fire;
					bullet.direction = direction;
					bullet.speed = 4;
					bullet.damage = 10;
					
					alarm[0] = GAME_SPEED *2;
					enemy_can_shoot = false;
			}
		}
	}break;
	
	case sprite_attack_melee_dir_array:{
		if (enemy_can_shoot_melee){
			image_speed = 0.2;
			if (image_index >= image_number - 2){
					//create bullet
					var xx = x + lengthdir_x(1, direction);
					var yy = y + lengthdir_y(1, direction);

					var bullet = instance_create_depth(xx,yy, 8, obj_bullet_enemy_melee);
					bullet.direction = direction;
					bullet.speed = 0;
					bullet.damage = 5;
					
					alarm[1] = GAME_SPEED/2;
					enemy_can_shoot_melee = false;
			}
		}
	}break;
}
