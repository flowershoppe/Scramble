/*
if(victory and !loss)
{
	draw_sprite_ext(spWinner, 0, window_get_width() / 2, window_get_height() / 2, 1, 1, 0, c_white, 1);
}*/

if(active == false)
{
	var _old_halign = draw_get_halign();
	draw_set_halign(fa_center);
	draw_text_transformed(window_get_width() / 2, window_get_height() / 2, 
						"press " + input_binding_get_name(input_binding_get("confirm")) + " to advance",
						1, 1, 0);	
	draw_set_halign(_old_halign);
}