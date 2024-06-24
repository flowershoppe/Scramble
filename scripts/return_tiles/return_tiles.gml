function return_tiles()
{	
	var _placed_tiles = oPlayer.placed_tiles;
	if(array_length(_placed_tiles) < 1){exit;}
	var _placed_tile = _placed_tiles[0];
	var _player = oPlayer;
	var _hand = oPlayerHand;
	var _placed_tile_holder;
	
	while(array_length(_placed_tiles) > 0)
	{
		_placed_tile = _placed_tiles[0]
		
		with(oTileHolder)
		{
			if(tile == _placed_tile){_placed_tile_holder = id;}	
		}
	
		//loop through until an empty tile holder is found
		for(var _index = 0; _index < _hand.size; _index++)
		{
			var _hand_tile_holder = _hand.tile_holder_array[_index];
			var _tile_in_holder = _hand_tile_holder.tile;
			
			if(_tile_in_holder == noone and array_contains(_placed_tiles, _placed_tile))
			{		
				_placed_tile.x = _hand_tile_holder.x;
				_placed_tile.y = _hand_tile_holder.y;
				_placed_tile.on_board = false;
				
				_hand_tile_holder.tile = _placed_tile;
				_placed_tile_holder.tile = noone;
				_placed_tile.layer = layer_get_id("Hand_Tiles");
				
				array_delete(_placed_tiles, 0, 1);
						
			}
		}
	}	
}