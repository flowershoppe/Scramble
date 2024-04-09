//directional movement that will not move beyond room limits
if(keyboard_check(right_button) and (x + camera_speed) < (room_width - (display_width / 2)))
{
	x += camera_speed;
}
if(keyboard_check(left_button) and (x - camera_speed) > ((display_width / 2)))
{
	x -= camera_speed;
}
if(keyboard_check(up_button) and (y - camera_speed) > ((display_height / 2)))
{
	y -= camera_speed;
}
if(keyboard_check(down_button) and (y + camera_speed) < (room_height - (display_height / 2)))
{
	y += camera_speed;
}

//zoom in and out
var _cam = view_camera[0];
var _factor = zoom_factor;
var _camh = camera_get_view_height(_cam);
var _camw = camera_get_view_width(_cam);
var _newh = _camh * _factor;
var _neww = _camw * _factor;
var _zoomoutw = _camw + _neww;
var _zoomouth = _camh + _newh;
var _zoominw = _camw - _neww;
var _zoominh = _camh - _newh;

//change the view so long as it wouldn't exceed room parameters
if(mouse_wheel_down() and (_zoomoutw < max_zoom) and (_zoomouth < max_zoom))
{
	camera_set_view_size(_cam, _zoomoutw, _zoomouth);
}
else if(mouse_wheel_up() and (_zoominw > min_zoom) and (_zoominh > min_zoom))
{
	camera_set_view_size(_cam, _zoominw, _zoominh);
}