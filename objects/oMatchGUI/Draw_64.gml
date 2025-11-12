if(global.exchanging)
{
	var _txt = "Select tiles to exchange."
	var _x = view_get_wport(0) / 2;
	var _y = view_get_hport(0) / 2;
	var _old_halign = draw_get_halign();
	var _old_valign = draw_get_valign();
	var _old_font = draw_get_font();
	
	draw_set_font(oGame.tile_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text(_x, _y, _txt);
	
	draw_set_halign(_old_halign);
	draw_set_valign(_old_valign);
	draw_set_font(_old_font);
}