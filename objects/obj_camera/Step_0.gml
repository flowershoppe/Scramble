//Locals

var _cam = view_camera[0];
var _factor = zoom_factor;
var _camx = camera_get_view_x(_cam);
var _camy = camera_get_view_y(_cam);
var _camxcent = _camx + (view_w / 2);
var _camycent = _camy + (view_h / 2);
var _camh = camera_get_view_height(_cam);
var _camw = camera_get_view_width(_cam);
var _newh = _camh * _factor;
var _neww = _camw * _factor;
var _zoomoutw = _camw + _neww;
var _zoomouth = _camh + _newh;
var _zoominw = _camw - _neww;
var _zoominh = _camh - _newh;

//zoom in and out
//change the view so long as it wouldn't exceed room parameters
//scroll down to zoom out
if(mouse_wheel_down() and (_zoomoutw < max_zoom) and (_zoomouth < max_zoom))
{
	camera_set_view_size(_cam, _zoomoutw, _zoomouth);
	view_h = _zoomouth;
	view_w = _zoomoutw;
	
	//recenter camera
	if(x != _camxcent)
	{
		x = _camxcent;	
	}
	if(y != _camycent)
	{
		y = _camycent;	
	}
}
//scroll up to zoom in
else if(mouse_wheel_up() and (_zoominw > min_zoom) and (_zoominh > min_zoom))
{
	camera_set_view_size(_cam, _zoominw, _zoominh);
	view_h = _zoominh;
	view_w = _zoominw;
	
	//recenter camera
	if(x != _camxcent)
	{
		x = _camxcent;	
	}
	if(y != _camycent)
	{
		y = _camycent;	
	}
}

var _most_recent_horiz_button = most_recent_button(horiz_button_arr, horiz_button_chron_order_arr);
var _most_recent_vert_button = most_recent_button(vert_button_arr, vert_button_chron_order_arr);

//move camera based on most recent directional keys pressed
var _horiz_camera_move_direction;
switch (_most_recent_horiz_button)
{
	case left_button:
		_horiz_camera_move_direction = -1;
	break;
	case vk_nokey:
		_horiz_camera_move_direction = 0;
	break;
	case right_button:
		_horiz_camera_move_direction = 1;
	break;
}
x += _horiz_camera_move_direction * camera_speed;

var _vert_camera_move_direction;
switch (_most_recent_vert_button)
{
	case up_button:
		_vert_camera_move_direction = -1;
	break;
	case vk_nokey:
		_vert_camera_move_direction = 0;
	break;
	case down_button:
		_vert_camera_move_direction = 1;
	break;
}
y += _vert_camera_move_direction * camera_speed;

//move camera if view exceeds room limits
var _view_horiz_left_limit = view_w / 2;
var _view_horiz_right_limit = room_width - view_w / 2;
var _view_vert_down_limit = room_height - view_h / 2;
var _view_vert_up_limit = view_h / 2;

x = max(x, _view_horiz_left_limit);
x = min(x, _view_horiz_right_limit);
y = min(y, _view_vert_down_limit);
y = max(y, _view_vert_up_limit);
