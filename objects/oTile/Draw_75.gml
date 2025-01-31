if(wait_for_input)
{
	draw_text(view_get_wport(0) / 2, view_get_hport(0) / 4, "Please enter a character");	
}

var _old_halign = draw_get_halign();
var _old_valign = draw_get_valign();
var _old_font = draw_get_font();

if(on_board or !visible){exit;}

//draw self
draw_sprite_ext(spr, 0, x, y, xscale, yscale, 0, c_white, 1);


if(selected)
{
	draw_sprite_ext(spSelected, 0, x, y, xscale, yscale, 0, c_white, 1);
}

var _x_offset = (sprite_width * xscale) * 0.05;
var _y_offset = (sprite_height * yscale) * 0.1;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font);

//draw letter
draw_text_transformed_color(x - _x_offset, y - _y_offset, letter, xscale, yscale, 
							0, font_color, font_color, font_color, font_color, 100);

var _scale = (font_scale / 3) + (xscale - 1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

_x_offset = (sprite_width * xscale) * 0.3;
_y_offset = (sprite_height * yscale) * 0.3;

//draw point value	
draw_text_transformed_color(x + _x_offset, y - _y_offset, pointvalue, _scale, _scale, 
							0, font_color, font_color, font_color, font_color, 100);

draw_set_halign(_old_halign);
draw_set_valign(_old_valign);
draw_set_font(_old_font);
