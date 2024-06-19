owner = oPlayer;

empty = true;

spr = spPlank;
spr_w = sprite_get_width(spPlank);
spr_h = sprite_get_height(spPlank);

//create tile array
tile_holder_array = [];
var i;

var _space_between_tiles = sprite_width / (size);
var _x_loc = x - (sprite_width / 2) - (sprite_get_width(spBoardTile) * 0.75);
for(i = 0; i < size; i++)
{
	/*var _left = x - (sprite_width * 0.8) / 2;
	var _offset = sprite_get_width(spBoardTile) * i;
	var _space_between_tiles = (((sprite_width * 0.8) / 2) / (size + 1)) * i;
	var _x_loc = _left + _offset + _space_between_tiles;	*/
	
	_x_loc += _space_between_tiles;
	var _holder = instance_create_depth(_x_loc, y, -8, oTileHolder);
	var _array = tile_holder_array;
	array_push(_array, _holder);
	_holder.owner = self;
}