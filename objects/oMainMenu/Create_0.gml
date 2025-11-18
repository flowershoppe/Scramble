ind = 0;
letters = ["S", "C", "R", "A", "M", "B", "L", "E"];
length = array_length(letters);
size = sprite_get_width(spLetterTile);
width = size * (length - 1);
animate = false;

x_loc = (room_width / 2) - (width / 2);
y_loc = room_height * 0.25;

alarm_set(0, 50);

for(var i = 0; i < length; i ++)
{
	instance_create_layer(x_loc, y_loc, "Board_Tile_Holders", oTileHolder);
	x_loc += size;
}
x_loc = (room_width / 2) - (width / 2);