//Add tile to hand from tilebag
function add_tile_to_hand(_amount)
{
	var _array = oTilebag.match_tiles;
	var _hand = oPlayerHand;
	for(var _count = 0; _count < _amount; _count++)
	{
		//ensure bag isn't empty
		if(array_length(_array) < 1){ exit; }
	
		//loop through until an empty tile holder is found
		for(var i = 0; i < _hand.size; i++)
		{
			var _tile_holder = _hand.tile_holder_array[i];
			
			if(_tile_holder.tile == noone)
			{		
				//find random tile from bag and set _tile equal to it				
				var _random = irandom(array_length(_array) - 1);
				var _bag_tile = _array[_random];
				var _tile = _bag_tile;
		
				//remove tile from bag
				array_delete(_array, _random, 1);
		
				//place tile id in tile holder
				_tile_holder.tile = _tile;
				_tile.layer = layer_get_id("Hand_Tiles");
				_tile.visible = true;
				_tile.in_hand = true;
				_tile.x = _tile_holder.x;
				_tile.y = _tile_holder.y;
				_tile.persistent = false;
				
				i = _hand.size;
			}
		}
	}
}