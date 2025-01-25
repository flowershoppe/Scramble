draw_self();

draw_set_font(font);
var _string = string(array_length(tiles));

draw_text_color(x, y, _string, 
				c_white, c_white, c_white, c_white, 1);
/*
if(show_contents)
{
	var _length = array_length(tiles);
	var _h_limit = 10;
	var _bg = spHolder;
	var _x_loc = 
	
	for(var _i = 0; _i < _length; _i++)
	{
		var _tile = tiles[_i];
		var _sp = _tile.sprite_index;
	}
}