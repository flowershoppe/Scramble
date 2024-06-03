//board dimensions
grid_width = 15;
grid_height = 15;

spr = spBoard;

var _tile_size = sprite_get_width(spBoardTile);

//set board draw parameters
image_xscale = (grid_width * _tile_size + _tile_size) / sprite_width;
image_yscale = (grid_height * _tile_size + _tile_size) / sprite_height;
x = room_width / 2;
y = room_height / 2;

var i, j;
var _offset = (room_width / 4) + (_tile_size / 2);

var _prev_holder = 0;

for(i = 0; i < grid_width; i++)
{
	for(j = 0; j < grid_height; j++)
	{
		//create tile holders
		var _holder = instance_create_layer(_offset + (i * _tile_size), 
					_offset + (j * _tile_size), "Board_Tile_Holders", oTileHolder);
		
		_holder.x_coord = i;
		_holder.y_coord = j;
		_holder.owner = oBoard;
		_holder.lmult = irandom_range(1, 3);
		if(_holder.lmult == 1)
		{
			_holder.wmult = irandom_range(1, 3);	
		}
		
		if(_prev_holder != 0)
		{
			_prev_holder.east_holder = _holder;
		}
		
		_prev_holder = _holder;
		
	}
	
}

