//board dimensions
grid_width = 15;
grid_height = 15;

spr = spr_board;

//store tile id's in this array
tile_array[0][0] = 0;

var i, j;
var _offset = room_width / 4;
var _tile_size = 64;

for(i = 0; i < grid_width; i++)
{
	for(j = 0; j < grid_height; j++)
	{
		//create tile holders
		var _tile = instance_create_layer(_offset + (i * _tile_size), _offset + (j * _tile_size), "Board", obj_tile_holder);
		_tile.x_coord = i;
		_tile.y_coord = j;
	}
	
}

