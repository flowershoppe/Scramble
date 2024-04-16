//Locals

var _cam		= maincam;
var _factor		= zoom_factor;
var _mousew		= mouse_wheel_down() - mouse_wheel_up();
var _camx		= camera_get_view_x(_cam);
var _camy		= camera_get_view_y(_cam);
var _camxcent	= _camx + (view_w / 2);
var _camycent	= _camy + (view_h / 2);
var _camh		= camera_get_view_height(_cam);
var _camw		= camera_get_view_width(_cam);
var _newh		= _camh * _factor;
var _neww		= _camw * _factor;
var _zoomoutw	= _camw + _neww;
var _zoomouth	= _camh + _newh;
var _zoominw	= _camw - _neww;
var _zoominh	= _camh - _newh;

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

//directional movement that will not move beyond room limits
if(keyboard_check(right_button) and (x + camera_speed) < (room_width - (view_w / 2)))
{
	x += camera_speed;
}
if(keyboard_check(left_button) and (x - camera_speed) > ((view_w / 2)))
{
	x -= camera_speed;
}
if(keyboard_check(up_button) and (y - camera_speed) > ((view_h / 2)))
{
	y -= camera_speed;
}
if(keyboard_check(down_button) and (y + camera_speed) < (room_height - (view_h / 2)))
{
	y += camera_speed;
}
