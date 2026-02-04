//add tiles to hand
var _array = oTilebag.match_tiles;
if(inc > 0)
{
	//ensure bag isn't empty
	if(array_length(_array) < 1){ exit; }
	
	//loop through until an empty tile holder is found
	for(var i = 0; i < size; i++)
	{
		var _tile_holder = tile_holder_array[i];
			
		if(_tile_holder.tile == noone)
		{		
			//find random tile from bag and set _tile equal to it				
			var _random = irandom(array_length(_array) - 1);
			var _bag_tile = _array[_random];
			var _tile = _bag_tile;
			if(oMatchManager.turn == 1 and room == rGame and inc == 1)
			#region
			{
				with(oTile)
				{	
					if(visible)
					{
						if(!array_contains(global.vowels, letter) and letter != "Y" and letter != "_")
						{
							oPlayerHand.no_vowels = true;
						}
						else
						{
							oPlayerHand.no_vowels = false;
							break;
						}
					}
				}
			}
			#endregion
			var _count = 0;
			var _array_copy = [];
			array_copy(_array_copy, 0, _array, 0, array_length(_array));
			while(no_vowels and _count <= array_length(oTilebag.tiles))
			{
				_random = irandom(array_length(_array_copy) - 1);
				_bag_tile = _array_copy[_random];
				_tile = _bag_tile;
				if(array_contains(global.vowels, _tile.letter))
				{
					break;
				}
				_count++;
				array_delete(_array_copy, _random, 1);
			}
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
			wiggle(_tile);
				
			audio_play_sound_on(oGame.emitter_SE, sdPlace1, false, 1);
				
			break;
		}
	}
	inc--;
	alarm_set(0, interval);
}
else
{
	oMatchManager.no_vowels_flag = true;
	broadcast("hand filled");
	save_game();
}