shop_size = tile_count + charm_count;

buffer = 60;
size = sprite_get_width(spLetterTile);
width = (size + buffer) * (tile_count - 1);
x_loc = (room_width / 2) - (width / 2);
y_loc = (room_height / 2);

if(array_equals(tiles, []))
{
	repeat(tile_count)
	{
		array_push(tiles, undefined);
		add_tile_to_shop();
	}
}
if(array_equals(charms, []))
{
	repeat(charm_count)
	{
		array_push(charms, undefined);
		add_charm_to_shop();
	}
}