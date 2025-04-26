function check_end_match()
{
	//-----CHECK FOR VICTORY-----
	with(oMatchManager)
	{
		//if player's total points exceed win con points
		if(total_points >= point_min)
		{
			oMatchManager.victory = true;	
			oMatchManager.active = false;
			//match becomes inactive upon winning
		}

		//if a played tile exists on the win con location
		with(oTile)
		{
			if(!grabbable and instance_place(x, y, oTileHolder).winspot == true)
			{
				oMatchManager.victory = true;
				oMatchManager.active = false;
				//match becomes inactive upon winning
			}	
		}

		var _cant_play = false;
		//tilebag empty, hand empty, no tiles placed this turn, and no held tile
		if(array_length(oTilebag.match_tiles) < 1 
			and oPlayerHand.empty
			and array_length(oPlayer.placed_tiles) < 1 
			and oCursor.held_tile == noone)
		{
			_cant_play = true;	
		}

		//lose match
		if((turn_max <= turn and turn_max > -1) or	
			(turn_min >= turn and _cant_play and turn_min > -1) or
			(point_max <= total_points and point_max > -1) or
			(point_min >= total_points and _cant_play and point_min > -1) or
			(oMatchManager.victory == false and _cant_play))
		{
			var _saveloc = "gamesave.save";
			oMatchManager.active = false;
			oMatchManager.loss = true;
			file_delete(_saveloc);
			show_debug_message("Deleting save at" + _saveloc)
			broadcast("match end");
			room_goto(rGameOver);
			with(oRun){alarm_set(1, 1);}
		}

		else
		{
			oMatchManager.loss = false;	
		}
		
		//win match
		if(oMatchManager.victory and !oMatchManager.loss)
		{		
			with(yui_document)
			{
				if(yui_file == "YUI screens/match_buttons.yui")
				{
					instance_destroy();
				}
			}
			//put tiles back in bag
			with(oTile)
			{
				if(array_contains(oTilebag.tiles, id))
				{
					persistent = true;	
				}
			}
			dialogue_open(adialogue, []);
			broadcast("match end");
			//audio_stop_sound(global.music_game);
			//audio_play_sound_on(global.emitterMS, global.music_victory, true, 100);
		}
	}
}