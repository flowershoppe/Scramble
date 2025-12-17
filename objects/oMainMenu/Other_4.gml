if(room == rMainMenu)
{
	layer = layer_get_id("Board");
	alarm_set(0, 60);
	for(var i = 0; i < length; i ++)
	{
		instance_create_layer(x_loc, y_loc, "Board_Tile_Holders", oTileHolder);
		x_loc += size;
	}
	x_loc = (room_width / 2) - (width / 2);

}