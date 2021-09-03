if( mana_type == 3){
	if audio_is_playing(snd_sfx_pickup_mana_green) audio_stop_sound(snd_sfx_pickup_mana_green);
	audio_play_sound(snd_sfx_pickup_mana_green,100,false);
}else{
	if audio_is_playing(snd_sfx_pickup_mana) audio_stop_sound(snd_sfx_pickup_mana);
	audio_play_sound(snd_sfx_pickup_mana,100,false);
}