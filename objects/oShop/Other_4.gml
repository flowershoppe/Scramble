tiles = [];

//fill shop
switch(room)
{
	case rShop:
		//populate tiles
		for(var _i = 0; _i < array_length(tile_specs); _i++)
		{
			var _tile = instance_create_layer(-5, -5, "UI", oTile, 
			{
				letter: tile_specs[_i].letter,
				pointvalue : tile_specs[_i].pointvalue,
				persistent : false,
				visible : false
			});
			array_push(tiles, _tile);
		}
		
		//populate charms
		for(var _i = 0; _i < array_length(charms); _i++)	
		{
			instance_create_layer(-5, -5, "UI", charms[_i], 
			{
				persistent : false,
				visible : false
			});
		}
	break;
}