function create_menu_page(){
	//["name1", type1, entires1...]
	
	var arg, i = 0;
	repeat(argument_count){
		arg[i] = argument[i];
		++i;
	}
	
	var ds_grid_id = ds_grid_create(5, argument_count);
	i = 0; repeat(argument_count){
		var array = arg[i];
		var array_len = array_length(array);
		
		var xx = 0 repeat(array_len){
			ds_grid_id[# xx, i] = array[xx];
			++xx;
		}
		++i;
	}
	
	return ds_grid_id;

}

function resume_game(){
	if (room == rm_main){
		instance_create_depth(0,0,0,obj_ctrl_fade);
	}else{
		instance_destroy();	
	}
}

function exit_game(){
	game_end();
}


//settings
function change_difficulty(){
	switch(argument0){
		case 0:{
			//super easy
			
		}break;
		
		case 1:{
			//easy
			
		}break;
		
		case 2:{
			//normal
			
		}break;
		
		case 3:{
			//hard
			
		}break;
		
		case 4:{
			//NIGHTMARE
			
		}break;
		
	}
}

function change_viewbob(){
	global.allow_view_bob = !global.allow_view_bob;
}

function change_volume(){
	var type = menu_option[page];
	
	switch(type){
		case 0: audio_master_gain(argument0); break;
		case 1: audio_group_set_gain(AudioGroup_SFX, argument0, 0); break;
		case 2: audio_group_set_gain(AudioGroup_Music, argument0, 0); break;
		
		audio_stop_sound(snd_sfx_switch);
		audio_stop_sound(snd_sfx_wep_punch);
	}
}