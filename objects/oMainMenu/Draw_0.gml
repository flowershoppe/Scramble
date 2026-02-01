if(room == rMainMenu)
{
	//title shadow
	draw_sprite_ext(spDropShadow, 0, (room_width / 2), y_loc, 0.7, 0.25, 0, c_teal, 1);
	//menu shadow
	draw_sprite_ext(spDropShadow, 0, (room_width / 2), room_height * 0.65, 0.3, 0.35, 0, c_teal, 1);
}

/*draw_sprite_ext(spDropShadow, 0, (room_width / 2), y_loc, 
	((size * length) * 1.5) / sprite_get_width(spDropShadow), (size * 2) / sprite_get_height(spDropShadow), 
	180, c_white, 1);