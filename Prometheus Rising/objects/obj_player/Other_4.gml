alarm[0] = -1;
wait_for_reset = true;

global.Player_Health = global.Player_MAX_Health;
global.Player_is_alive = true;

global.Player_item_blue_key = false;
global.Player_item_red_key = false;
global.Player_item_yellow_key = false;


if (global.Player_Mana_orng < global.Player_MAX_Mana){
	global.Player_Mana_orng = global.Player_MAX_Mana;
}