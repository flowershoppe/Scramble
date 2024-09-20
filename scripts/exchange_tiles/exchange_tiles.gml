function exchange_tiles()
{	
	return_tiles();
	
	if(!global.exchanging)
	{
		global.exchanging = !global.exchanging;
		exit;	
	}
	
	var _array = [];
	
	with(oTileHolder)
	{
		if(tile != noone and tile.selected)
		{
			array_push(_array, tile);
			tile = noone;				
		}
	}
	
	//only exchange if tiles have been selected
	if(array_length(_array) > 0)
	{
		add_tile_to_hand(oPlayerHand, global.tilebag, array_length(_array));
	
		for(var _index = 0; _index < array_length(_array); _index++)
		{
			var _tile = _array[_index];		
			array_push(global.tilebag.tiles, _tile);
			_tile.visible = false;
			_tile.x = 0;
			_tile.y = 0;
		
		}		
		oMatchStats.exchange_count++;
		next_turn();
	}
	
	with(oTile)
	{
		selected = false;	
	}
	
	global.exchanging = !global.exchanging;
	
	
}