if(wait == false)
{
	draw_sprite_ext(spLogo, 0, -20 + window_get_width() / 2, window_get_height() / 2, 1, 1, 0, c_white, alpha);
	
	var t = scribble("[fnt_dutch][fa_center][c_white][fa_middle]a game by fio aleksandra");
	t.draw(window_get_width() / 2, window_get_height() * 0.75, typist);
}