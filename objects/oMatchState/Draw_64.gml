if(victory and !loss)
{
	draw_sprite_ext(spWinner, 0, window_get_width() / 2, window_get_height() / 2, 1, 1, 0, c_white, 1);
}

if(active == false)
{
	draw_set_halign(fa_center);
	draw_text_transformed(window_get_width() / 2, window_get_height() / 2, 
						"press " + get_key_name(oGame.keys.confirm) + " to advance",
						1, 1, 0);	
}