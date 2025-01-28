draw_self();

var _old_halign = draw_get_halign();
var _old_valign = draw_get_valign();
var _old_font = draw_get_font();

draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _string = string(array_length(tiles));

draw_text_color(x, y, _string, 
				c_white, c_white, c_white, c_white, 1);
				
draw_set_font(_old_font);
draw_set_halign(_old_halign);
draw_set_valign(_old_valign);