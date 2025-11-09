function set_tile_font(_struct)
{
	var o = oGame;
	o.tile_font = _struct.normal;
	o.tile_font_small = _struct.small;
	o.font = _struct;
	
	save_settings();
}