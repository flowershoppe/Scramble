x_loc = view_get_xport(0) + sprite_get_width(spr);
y_loc = view_get_yport(0) + (view_get_hport(0) * 0.9);

draw_sprite_ext(spr, 0, x_loc, y_loc, 1, 1, 0, c_white, 1);

draw_text_color(x_loc, y_loc, string(array_length(tiles)), 
				c_white, c_white, c_white, c_white, 1);