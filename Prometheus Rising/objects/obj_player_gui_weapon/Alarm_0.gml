//animation
sprite_index = spr_wep_hand_reset;
image_speed = animation_speed;
weapon_is_shooting = 3;
global.Player_weapon_canswitch = true;
weapon_is_shooting_fail = false;

var shoot_act_held = mouse_check_button(PLAYERBUTTON_SHOOT);
if !(shoot_act_held){
	weapon_fired_once = false;
}