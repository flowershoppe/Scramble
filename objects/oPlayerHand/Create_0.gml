owner = oPlayer;

spr = spPlank;
spr_w = sprite_get_width(spPlank);
spr_h = sprite_get_height(spPlank);
hand_width = 7;

//create tile array
tile_holder_array = [];
var i;

for(i = 0; i < hand_width; i++)
{
	tile_holder_array[i] = instance_create_layer(x, y, "Hand_Tile_Holders", oTileHolder);
	tile_holder_array[i].owner = self;
}