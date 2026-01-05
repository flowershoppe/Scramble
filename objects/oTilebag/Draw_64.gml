image_blend = 22166;
draw_self();

if(oMatchManager.active == true)
{
	yui_tiles = match_tiles;
}
else
{
	yui_tiles = tiles;
}

var _string = string(array_length(yui_tiles));

var t = scribble("[fa_center][fa_middle] " + _string);
t.draw(x - 10, y + 15);
t.starting_format(font_get_name(oGame.tile_font), c_white);
t.sdf_outline(c_black, 2);

