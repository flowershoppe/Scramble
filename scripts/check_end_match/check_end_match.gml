function check_end_match()
{
	//-----CHECK FOR VICTORY-----
	with(oMatchManager)
	{
		//win cons
		#region
		var _win = oMatchManager.victory;
		var _p_min = false;
		var _p_max = false;
		var _t_min = false;
		var _t_max = false;
		
		if(point_min != -1)
		{
			if(total_points >= point_min)
			{
				_p_min = true;	
			}
			else{_p_min = false;}
		}
		else{_p_min = true;}
		
		if(point_max != -1)
		{
			if(total_points <= point_max)
			{
				_p_max = true	
			}
			else{_win = false;}
		}
		else{_p_max = true;}
		
		if(turn_min != -1)
		{
			if(turn_min <= turn)
			{
				_t_min = true;	
			}
			else{_t_min = false;}
		}
		else{_t_min = true;}
		
		if(turn_max != -1)
		{
			if(turn_max >= turn)
			{
				_t_max = true;	
			}
			else{_t_max = false;}
		}
		else{_t_max = true;}
		
		/*var _four_lose = false;
		//all four cons
		if(point_min != -1 and
			point_max != -1 and
			turn_min != -1 and
			turn_max != -1)
		{
			if(point_min <= total_points and total_points <= point_max)
			{
				if(turn == turn_min)
				{
					_win = true;
				}
				else
				{
					_four_lose = true;
				}
			}
			
		}*/
		
		if(_p_min and _p_max and _t_min and _t_max)
		{
			_win = true;	
		}
		#endregion
		//if a played tile exists on the win con location
		with(oTile)
		{
			if(!grabbable and instance_place(x, y, oTileHolder).winspot == true)
			{
				_win = true;
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
	
		if(_win)
		{
			oMatchManager.active = false;	
		}
		//lose match
		if((turn_max < turn and turn_max > -1) or	
			(turn_min > turn and _cant_play and turn_min > -1) or
			(point_max < total_points and point_max > -1) or
			(point_min > total_points and _cant_play and point_min > -1) or
			(_win == false and _cant_play))
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
		if(_win and !oMatchManager.loss)
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
		
		oMatchManager.victory = _win;
	}
}