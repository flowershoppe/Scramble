/*
if(victory and !loss and room == rGame)
{
	draw_sprite_ext(spWinner, 0, window_get_width() / 2, window_get_height() / 2, 1, 1, 0, c_white, 1);
}

if(global.exchanging)
{
	var _string = "Select Tiles to Exchange";
	
	draw_text_color((window_get_width() / 2) - string_length(_string) / 2, (window_get_height / 2), _string,
					c_white, c_white, c_white, c_white, 1);	
}