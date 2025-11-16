if(charms_full_message)
{
	//scribble_font_set_default(oGame.tile_font_name);
	var t = scribble("[fnt_elektra_big][fa_center][fa_middle]You can only have up to " + string(max_charms) + " charms.");
	t.draw(display_get_gui_width() / 2, display_get_gui_height() / 2);
	t.sdf_outline(c_black, 2);
}