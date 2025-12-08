if(wait == false)
{
	var _scale = 1;
	outline_start(5, c_black);
	draw_sprite_ext(spLogo, 0, (room_width / 2) - 20, (room_height * 0.4), _scale, _scale, 0, c_white, alpha);
	
	var t = scribble("[fnt_dutch][fa_center][c_white][fa_middle]a game by fio aleksandra");
	t.draw(room_width / 2, (room_height * 0.6), typist);
	t.sdf_outline(c_black, 2);
}