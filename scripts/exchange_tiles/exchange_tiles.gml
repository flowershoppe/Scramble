function exchange_tiles()
{
	var _array = [];
	
	with(oTileHolder)
	{
		if(tile != noone)
		{
			if(tile.selected)
			{
				array_push(_array, tile);
				tile = noone;	
			}
		}
	}
	with(oTile)
	{
		selected = false;	
	}
	
	add_tile_to_hand(oPlayerHand, global.tilebag, array_length(_array));
	
	for(var _index = 0; _index < array_length(_array); _index++)
	{
		var _tile = _array[_index];		
		array_push(global.tilebag.tiles, _tile);
		
	}	
}