function exchange_tiles()
{	
	return_tiles();
	
	if(!global.exchanging)
	{
		global.exchanging = !global.exchanging;
		exit;	
	}
	
	var _array = [];
	
	//remve tile selected tiles from holders
	with(oTileHolder)
	{
		if(tile != noone and tile.selected)
		{
			array_push(_array, tile);
			tile.in_hand = false;
			tile.layer = layer_get_id("Tilebag");
			tile = noone;					
		}
	}
	
	//only exchange if tiles have been selected
	if(array_length(_array) > 0)
	{
		add_tile_to_hand(oPlayerHand, oTilebag, array_length(_array));
	
		for(var _index = 0; _index < array_length(_array); _index++)
		{
			var _tile = _array[_index];		
			array_push(oTilebag.match_tiles, _tile);
			_tile.visible = false;
			_tile.x = 0;
			_tile.y = 0;
		
		}		
		oMatchManager.exchange_count++;
		next_turn();
	}
	
	with(oTile)
	{
		selected = false;	
	}
	
	global.exchanging = !global.exchanging;
	
	
}