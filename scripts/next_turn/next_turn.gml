function next_turn()
{	
	var _player = oPlayer;
	var _placed_tiles = _player.placed_tiles;
	
	with(oTile)
	{
		if(layer == layer_get_id("Tiles"))
		{
			grabbable = false;	
		}
	}
	
	//reset turn-dependent variables
	_player.turn_spelled_words = [];
	_player.placed_tiles = [];

	oMatchStats.turn ++;
	
	//refill hand until full if bag has tiles
	if(array_length(oTilebag.tiles) > 0)
	{
		var _count = 0;
		while(_count < oPlayer.hand_size)
		{
			add_tile_to_hand(oPlayer.hand, oTilebag);
			_count++
		}
	}
	
	//-----CHECK FOR VICTORY-----
	with(oMatchState)
	{
		//if player's total points exceed win con points
		if(oMatchStats.total_points >= condition_points)
		{
			victory = true;	
			active = false;
			//match becomes inactive upon winning
		}

		//if a played tile exists on the win con location
		with(oTile)
		{
			if(!grabbable and instance_place(x, y, oTileHolder).winspot == true)
			{
				oMatchState.victory = true;
				oMatchState.active = false;
				//match becomes inactive upon winning
			}	
		}

		var _cant_play = false;
		//tilebag empty, hand empty, no tiles placed this turn, and no held tile
		if(array_length(oTilebag.tiles) < 1 
			and oPlayerHand.empty
			and array_length(oPlayer.placed_tiles) < 1 
			and oCursor.held_tile == noone)
		{
			_cant_play = true;	
		}

		if((turn_max <= oMatchStats.turn and turn_max > -1) or	
			(turn_min >= oMatchStats.turn and _cant_play) or
			(point_max <= oMatchStats.total_points and point_max > -1) or
			(point_min >= oMatchStats.total_points and _cant_play) or
			(victory == false and _cant_play))
		{
			loss = true;	
			active = false;
		}

		else
		{
			loss = false;	
		}
		
		if(victory and !loss)
		{
			audio_stop_sound(global.music_game);
			audio_play_sound_on(global.emitterMS, msVictory, true, 100);
		}
	}
}