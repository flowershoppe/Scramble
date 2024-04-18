//set to static location relative to camera
var _cam = maincam;
var _camw = camera_get_view_width(_cam);
var _camh = camera_get_view_height(_cam);
var _camx = camera_get_view_x(_cam);
var _camy = camera_get_view_y(_cam);
var _x_scale = (_camw * 0.75) / spr_w;
var _y_scale = (_camh * 0.2) / spr_h;
var _draw_width = _x_scale * spr_w;
var _draw_height = _y_scale * spr_h;
var _x_draw_location = _camx + (_camw / 2);
var _y_draw_location = _camy + _camh - (_draw_height / 2);

x = _x_draw_location;
y = _y_draw_location;
image_xscale = _x_scale;
image_yscale = _y_scale;

//tiles follow hand and scale size relative to it
var i = 0;
var _tile_size = _draw_height * 0.75;
var _offset = _draw_width / 7 - _tile_size;
var _left_align = _x_draw_location - (_draw_width * 0.5) + (_tile_size / 2) + _offset;

for(i = 0; i < hand_width; i++)
{
	var _tile = tile_array[i];
	var _tile_holder = tile_holder_array[i];
	
	//scale and move tile holder
	_x_scale = (_camh * 0.3) / spr_h;
	_tile_holder.x = _left_align + (_offset * i) + (_tile_size * i);
	_tile_holder.y = y;
	_tile_holder.image_xscale = _x_scale;
	_tile_holder.image_yscale = _x_scale;
	
	//scale and move tile
	if(_tile != noone)
	{
		_x_scale = (_camh * 0.3) / spr_h;
		_tile.x = _left_align + (_offset * i) + (_tile_size * i);
		_tile.y = y;
		_tile.image_xscale = _x_scale;
		_tile.image_yscale = _x_scale;
	}
}

