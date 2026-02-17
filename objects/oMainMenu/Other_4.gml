if(room == rMainMenu)
{
	instance_create_layer(x_loc, y_loc, "Hand", oPlayerHand, {size : 8});
	instance_create_layer(-100, -100, "Meta", oTilebag, {visible : false});
	for(var i = 0; i < array_length(menu_letters); i++)
	{
		add_tile_to_bag(menu_letters[i], global.letters[? menu_letters[i]], 1, true);
	}
	with(oPlayerHand)
	{
		inc = array_length(oMainMenu.menu_letters);
		alarm_set(1, 1);	
	}
}
	/*
	layer = layer_get_id("Board");
	alarm_set(0, 60);
	for(var i = 0; i < length; i ++)
	{
		instance_create_layer(x_loc, y_loc, "Board_Tile_Holders", oTileHolder);
		x_loc += size;
	}
	x_loc = (room_width / 2) - (width / 2);
	alarm_set(1, irandom_range(120, 180));
}*/