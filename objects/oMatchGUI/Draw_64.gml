if(global.exchanging)
{
	var _txt = "Select tiles to exchange."
	var _x = view_get_wport(0) / 2;
	var _y = view_get_hport(0) / 2;

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text(_x, _y, _txt);
}