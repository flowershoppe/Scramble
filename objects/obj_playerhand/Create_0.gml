owner = noone;

spr = spr_plank;
spr_w = sprite_get_width(spr_plank);
spr_h = sprite_get_height(spr_plank);
hand_width = 7;

//create tile array
tile_holder_array = [];
var i;

for(i = 0; i < hand_width; i++)
{
	tile_holder_array[i] = instance_create_layer(x, y, "Hand_Tile_Holders", obj_tile_holder);
	tile_holder_array[i].owner = self;
}