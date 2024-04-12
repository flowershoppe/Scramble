var _spr_width = sprite_get_width(spr_lettertile);
var _spr_height = sprite_get_height(spr_lettertile);
var _offset = room_width / 4;
var _board_width = grid_width * sprite_get_width(spr_lettertile);
var _board_height = grid_height * sprite_get_height(spr_lettertile);

//draw the board
draw_sprite_stretched(spr_board, 0, _offset + 1, _offset + 1, _board_width + 1, _board_height + 1);

//draw the grid
for(var i = 0; i <= grid_width; i++)
{
	draw_line_color(_spr_width * i + _offset, _offset, _spr_width * i + _offset, _board_height + _offset, c_white, c_white);
}

for(var i = 0; i <= grid_height; i++)
{
	draw_line_color(_offset, _spr_height * i + _offset, _board_width + _offset,  _spr_height * i + _offset, c_white, c_white);
}

