px = 0;
py = 0;

with(obj_player){
	other.px = x;
	other.py = y;
}

player_direct = point_direction(x,y,px,py);
player_direct = ( player_direct mod(360) );