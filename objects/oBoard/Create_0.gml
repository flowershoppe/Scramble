spr = spBoard;
holders = [];
coinchance = 1;
for(var i = 0; i < grid_width; i++)
{
	array_push(holders, array_create(grid_height));	
}
var _tile_size = sprite_get_width(spHolder);

//set board draw parameters
board_width = grid_width * _tile_size + _tile_size;
board_height = grid_height * _tile_size + _tile_size;
x = (room_width / 2) + _tile_size;
y = (room_height / 2) + _tile_size;

var _x, _y;
var _x_offset = (x - (board_width / 2));
var _y_offset = (y - (board_height / 2));

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
		
		holders[_x][_y] = _holder;
		_prev_holder = _holder;
		
	}
	
}
coinchance = 1;