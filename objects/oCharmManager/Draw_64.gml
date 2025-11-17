if(charms_full_message)
{
	scribble_font_set_default(font_get_name(oGame.tile_font))
	var t = scribble("[fa_center][fa_middle]You can only have up to " + string(max_charms) + " charms.");
	t.draw(display_get_gui_width() / 2, display_get_gui_height() / 2);
	t.sdf_outline(c_black, 2);
}