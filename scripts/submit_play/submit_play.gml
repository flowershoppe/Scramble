function submit_play()
{
	var _placed_tiles = oPlayer.placed_tiles;
	if(array_length(_placed_tiles) < 1){exit;}
	
	if(valid_play() and check_words())
	{	
		var _score = calculate_points();
		if(_score > 0)
		{
			oMatchManager.total_points += _score;
			oMatchManager.last_play = _score;
			
			//deactivate placed tiles
			with(oTile)
			{
				if(array_contains(_placed_tiles, id))
				{
					grabbable = false;	
				}
			}
		}
		next_turn();
	}
	else
	{
		audio_play_sound_on(oGame.emitter_SE, sdBack, false, 1);	
	}
}