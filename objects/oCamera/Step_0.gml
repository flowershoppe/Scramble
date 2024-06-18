//Move camera
#region

var _most_recent_horiz_button = most_recent_button(horiz_button_arr, horiz_button_chron_order_arr);
var _most_recent_vert_button = most_recent_button(vert_button_arr, vert_button_chron_order_arr);

//move camera based on most recent directional keys pressed
var _horiz_camera_move_direction;
switch (_most_recent_horiz_button)
{
	case oGame.keys.left:
		_horiz_camera_move_direction = -1;
	break;
	case vk_nokey:
		_horiz_camera_move_direction = 0;
	break;
	case oGame.keys.right:
		_horiz_camera_move_direction = 1;
	break;
}
x += _horiz_camera_move_direction * global.camera_speed;

var _vert_camera_move_direction;
switch (_most_recent_vert_button)
{
	case oGame.keys.up:
		_vert_camera_move_direction = -1;
	break;
	case vk_nokey:
		_vert_camera_move_direction = 0;
	break;
	case oGame.keys.down:
		_vert_camera_move_direction = 1;
	break;
}
y += _vert_camera_move_direction * global.camera_speed;

//move camera if view exceeds room limits
var _view_horiz_left_limit = view_w / 2;
var _view_horiz_right_limit = room_width - view_w / 2;
var _view_vert_down_limit = room_height - view_h / 2;
var _view_vert_up_limit = view_h / 2;

#endregion

//Zoom
#region

x = max(x, _view_horiz_left_limit);
x = min(x, _view_horiz_right_limit);
y = min(y, _view_vert_down_limit);
y = max(y, _view_vert_up_limit);

var _viewX = camera_get_view_x(global.maincam);
var _viewY = camera_get_view_y(global.maincam);
var _viewW = camera_get_view_width(global.maincam);
var _viewH = camera_get_view_height(global.maincam);

var _hor = keyboard_check(oGame.keys.right) - keyboard_check(oGame.keys.left);
var _ver = keyboard_check(oGame.keys.down) - keyboard_check(oGame.keys.up);

var _gotoX = x + (_hor * 200) - (_viewW * 0.5);
var _gotoY = y + (_ver * 150) - (_viewH * 0.5);
var _newX = lerp(_viewX, _gotoX, 0.1);
var _newY = lerp(_viewY, _gotoY, 0.1);
camera_set_view_pos(global.maincam, _newX, _newY);

var _factor = 0.2;
var _mouseW = mouse_wheel_down() - mouse_wheel_up();
zoomF = clamp(zoomF + (_mouseW * _factor), _factor, 2);
var _lerpH = lerp(_viewH, zoomF * 540, _factor);
var _newH = clamp(_lerpH, 0, room_height);var _newW = _newH * (960 / 540);
camera_set_view_size(global.maincam, _newW, _newH);
var _offsetX = _newX - (_newW - _viewW) * 0.5;
var _offsetY = _newY - (_newH - _viewH) * 0.5;
_newX = clamp(_offsetX, 0, room_width - _newW);
_newY = clamp(_offsetY, 0, room_height - _newH);
camera_set_view_pos(global.maincam, _newX, _newY);

#endregion