z = 0;

if (enemy_look_dir == 0){
	enemy_look_dir = direction;	
}

var enemy = instance_create_depth(x,y,z, enemy_to_create);
with(enemy){
	direction = other.enemy_look_dir;
}

instance_destroy();