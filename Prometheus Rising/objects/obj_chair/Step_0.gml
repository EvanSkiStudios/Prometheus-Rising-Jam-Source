object_audioemitter_update();

direction = point_direction(x,y,obj_player.x,obj_player.y);
display_direction += 10;

var _player_angle = point_direction(x, y, obj_player.x, obj_player.y);
var _sprite_angle = display_direction + angle_difference(display_direction, _player_angle);

if (_sprite_angle < 0) {
	_sprite_angle = (_sprite_angle % 360) + 360;
} else {
	if (_sprite_angle > 360) {
		_sprite_angle = _sprite_angle % 360;
	}
}

var frame_div = 360 / image_number;

image_index = _sprite_angle div frame_div;