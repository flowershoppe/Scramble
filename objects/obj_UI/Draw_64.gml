draw_set_font(font);

var _dis_w = global.display_width;
var _dis_h = global.display_height;

var _players_x = _dis_w * 0.9;
var _players_y = _dis_h * 0.5;
var _x_scale = 0.8;
var _y_scale = 0.8;

//draw back

draw_sprite(spr_players_back, 0, _players_x, _players_y + sprite_get_height(spr_players_back) / 2);


draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed(_players_x, _players_y, "Players", _x_scale, _y_scale, 0);

