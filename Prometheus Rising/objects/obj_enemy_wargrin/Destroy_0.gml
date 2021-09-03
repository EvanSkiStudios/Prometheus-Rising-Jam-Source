var length = array_length(global.enemy_array);

for (var i = 0; i > length; ++i){
	var door_id = global.enemy_array[i];
	
	if (door_id == id){
		array_delete(global.enemy_array,i,1);	
	}
}

instance_create_depth(x,y,1,obj_enemy_wargrin_dead);

var drop = irandom_range(0,2);
if (drop == 2){
	var drop_type = irandom_range(0,2);
	var mana = instance_create_depth(x,y,1,obj_item_mana);
	mana.mana_type = drop_type;
	mana.mana_multiplyer = 2;
}