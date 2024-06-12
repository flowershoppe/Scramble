function return_tiles()
{
	var _placed_tiles = oPlayer.placed_tiles;
	var _placed_tile = _placed_tiles[0];
	var _player = oPlayer;
	var _hand = oPlayerHand;
	
	while(array_length(_placed_tiles) > 0)
	{
		_placed_tile = _placed_tiles[0]
	
		//loop through until until an empty tile holder is found
		for(var _index = 0; _index < _player.hand_size; _index++)
		{
			var _tile_holder = _hand.tile_holder_array[_index];
			var _tile_in_holder = _tile_holder.tile;
		
			if(_tile_in_holder == noone and array_contains(_placed_tiles, _placed_tile))
			{		
				_placed_tile.x = _tile_holder.x;
				_placed_tile.y = _tile_holder.y;
				
				_tile_holder.tile = _placed_tile;
				_placed_tile.layer = layer_get_id("Hand_Tiles");
				
				array_delete(_placed_tiles, 0, 1);
						
			}
		}
	}	
}