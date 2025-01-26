//array of tile id's
tiles = [];

spr = spBag;

font = global.tile_font

x = view_get_xport(0) + sprite_get_width(spr);
y = view_get_yport(0) + (view_get_hport(0) * 0.9);

//contents window
bag_menu = noone;
stats_menu = noone;

width = window_get_width() / 2;
height = window_get_height() / 3;