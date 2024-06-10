spr = spBoard;

var _tile_size = sprite_get_width(spBoardTile);

//set board draw parameters
image_xscale = (grid_width * _tile_size + _tile_size) / sprite_width;
image_yscale = (grid_height * _tile_size + _tile_size) / sprite_height;
x = room_width / 2;
y = room_height / 2;

var _x, _y;
var _x_offset = (x - sprite_width / 2) + (_tile_size);
var _y_offset = (y - sprite_height / 2) + (_tile_size);

var _prev_holder = 0;

for(_x = 0; _x < grid_width; _x++)
{
	for(_y = 0; _y < grid_height; _y++)
	{
		//create tile holders
		var _holder = instance_create_layer(_x_offset + (_x * _tile_size), 
					_y_offset + (_y * _tile_size), "Board_Tile_Holders", oTileHolder);
		
		_holder.x_coord = _x;
		_holder.y_coord = _y;
		_holder.owner = oBoard;
		
		_prev_holder = _holder;
		
	}
	
}

