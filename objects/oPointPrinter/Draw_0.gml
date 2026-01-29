if(!gui)
{	
	t.starting_format(font_get_name(font), c_white);
	t.transform(xscale, yscale, direction - 90);
	t.draw(x, y, typist);
	t.sdf_outline(c_black, 2);
}