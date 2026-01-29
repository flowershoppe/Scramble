if(gui)
{	
	draw_sprite_ext(spr, 0, x, y, xscale * 0.75, yscale * 0.75, 0, c_white, alpha);
	t.starting_format(font_get_name(font), c_white);
	t.transform(xscale, yscale, direction);
	t.draw(x, y, typist);
	t.sdf_outline(c_black, 2);
}