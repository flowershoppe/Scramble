if(global.exchanging)
{
	var t = scribble("[fa_center][fa_middle]Select tiles to exchange.");
	t.starting_format(font_get_name(oGame.tile_font), c_white);
	t.sdf_outline(c_black, 2);
	t.draw(view_get_wport(0) / 2, view_get_hport(0) * 0.75);
}

if(oMatchManager.victory)
{
	var t = scribble("[fa_center][fa_middle]Click or press 'confirm' to continue.");
	t.starting_format(font_get_name(oGame.tile_font), c_white);
	t.sdf_outline(c_black, 2);
	t.draw(view_get_wport(0) / 2, view_get_hport(0) * 0.75);
}