//Set font and align to center of tile
draw_set_font(tile_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draw tile
draw_sprite_stretched_ext(spr, 0, x - spr_size/2, y - spr_size/2, spr_size, spr_size, c_white, 128);

//Draw tile letter
draw_text_color(x, y - spr_size * 0.15, letter, c_black, c_black, c_black, c_black, 100);