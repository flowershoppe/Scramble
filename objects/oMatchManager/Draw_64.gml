var _x = view_get_wport(0) / 2;
var _y = view_get_hport(0) / 3;

if(no_vowels)
{
	var t = scribble("[fa_center]No vowels present on first turn.\nYou may exchange with no penalty.");
	t.starting_format(font_get_name(oGame.tile_font), c_white);
	t.draw(_x, _y);
	t.sdf_outline(c_black, 2);
}