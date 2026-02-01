var _tile_size = sprite_get_width(spHolder);
//shadow
spr = spDropShadow;
draw_sprite_ext(spr, 0, x - 64, y - 64, (board_width + _tile_size * 2) / sprite_get_width(spr), (board_height + _tile_size * 2) / sprite_get_height(spr),
				0, c_black, 1);

spr = spBoard;
draw_sprite_part_ext(spr, 0, 0,	0,
					board_width, board_height,
					x - (board_width / 2) - _tile_size, y - (board_height / 2) - _tile_size, 
					1, 1, c_white, 1);