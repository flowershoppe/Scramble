owner = oPlayer;

empty = false;

spr = spPanel;
spr_w = sprite_get_width(spPlank);
spr_h = sprite_get_height(spPlank);

inc = 0;
interval = 10;
no_vowels = false;

//create tile array
tile_holder_array = [];

var _space_between_tiles = spr_w  / (size + 1);
var _x_loc = x - (spr_w / 2);
for(var i = 0; i < size; i++)
{
	_x_loc += _space_between_tiles;	
	var _holder = instance_create_layer(_x_loc, y, "Hand_Tile_Holders", oTileHolder);
	var _array = tile_holder_array;
	array_push(_array, _holder);
	_holder.owner = self;
}