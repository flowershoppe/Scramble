function check_end_match()
{
	//-----CHECK FOR VICTORY-----
	with(oMatchStats)
	{
		//if player's total points exceed win con points
		if(total_points >= point_min)
		{
			oMatchState.victory = true;	
			oMatchState.active = false;
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

		if((turn_max <= turn and turn_max > -1) or	
			(turn_min >= turn and _cant_play and turn_min > -1) or
			(point_max <= total_points and point_max > -1) or
			(point_min >= total_points and _cant_play and point_min > -1) or
			(oMatchState.victory == false and _cant_play))
		{
			oMatchState.loss = true;	
			oMatchState.active = false;
		}

		else
		{
			oMatchState.loss = false;	
		}
		
		if(oMatchState.victory and !oMatchState.loss)
		{
			audio_stop_sound(global.music_game);
			audio_play_sound_on(global.emitterMS, global.music_victory, true, 100);
		}
	}
}