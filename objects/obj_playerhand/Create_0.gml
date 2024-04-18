spr = spr_plank;
spr_w = sprite_get_width(spr_plank);
spr_h = sprite_get_height(spr_plank);
hand_width = obj_player.hand_size;

//create tile array
tile_array = [];
tile_holder_array = [];
var i;

for(i = 0; i < hand_width; i++)
{
	tile_holder_array[i] = instance_create_layer(x, y, "Hand_Tile_Holders", obj_tile_holder);
	tile_holder_array[i].x_coord = i;
	tile_holder_array[i].y_coord = 0;
	tile_holder_array[i].owner = self;
}

for(i = 0; i < hand_width; i++)
{
	tile_array[i] = instance_create_layer(0, 0, "Hand_Tiles", obj_tile);
	var _tile = tile_array[i];
	_tile.letter = "A";
	_tile.in_hand = true;
}