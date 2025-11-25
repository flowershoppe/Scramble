if(wait == false)
{
	var _scale = 1;
	draw_sprite_ext(spLogo, 0, (room_width / 2) - 25, (room_height / 2), _scale, _scale, 0, c_white, alpha);
	
	var t = scribble("[fnt_dutch][fa_center][c_white][fa_middle]a game by fio aleksandra");
	t.draw((room_width / 2) - 20, (room_height * 0.75), typist);
}