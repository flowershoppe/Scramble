function shuffle_hand()
{
	var _array = [];
	with(oTile)
	{
		if(in_hand)
		{
			array_push(_array, id);	
		}
	}
	if(array_length(_array) < 1){exit;}
	
	var _shuffles = [sdShuffle1, sdShuffle2, sdShuffle3];
	audio_play_sound_on(oGame.emitter_SE, _shuffles[irandom_range(0, 2)], false, 1)
	
	array_shuffle_ext(_array);
	var _diff = array_length(oPlayerHand.tile_holder_array) - array_length(_array);
	for(var i = 0; i < _diff; i++)
	{
		array_push(_array, noone);	
	}
	for(var i = 0; i < oPlayerHand.size; i++)
	{		
		if(_array[i] != noone)
		{
			oPlayerHand.tile_holder_array[i].tile = _array[i];
			_array[i].x = oPlayerHand.tile_holder_array[i].x;
			_array[i].y = oPlayerHand.tile_holder_array[i].y;
		}
		else
		{
			oPlayerHand.tile_holder_array[i].tile = noone;	
		}
	}
}