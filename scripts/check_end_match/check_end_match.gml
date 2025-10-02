function check_end_match()
{
	//-----CHECK FOR VICTORY-----
	with(oMatchManager)
	{
		//win cons
		var _pminactive = false;
		var _pmaxactive = false;
		var _tminactive = false;
		var _tmaxactive = false;
		#region
		var _win = oMatchManager.victory;
		var _p_min = false;
		var _p_max = false;
		var _t_min = false;
		var _t_max = false;
		if(point_min != -1){_pminactive = true;}
		if(point_max != -1){_pmaxactive = true;}
		if(turn_min != -1){_tminactive = true;}
		if(turn_max != -1){_tmaxactive = true;}
		
		if(_pminactive)
		{
			if(total_points >= point_min)
			{
				_p_min = true;	
			}
			else{_p_min = false;}
		}
		else{_p_min = true;}
		
		if(_pmaxactive)
		{
			if(total_points <= point_max)
			{
				_p_max = true	
			}
			else{_win = false;}
		}
		else{_p_max = true;}
		
		if(_tminactive)
		{
			if(turn_min <= turn)
			{
				_t_min = true;	
			}
			else{_t_min = false;}
		}
		else{_t_min = true;}
		
		if(_tmaxactive)
		{
			if(turn_max >= turn)
			{
				_t_max = true;	
			}
			else{_t_max = false;}
		}
		else{_t_max = true;}
		
		var _targetturn = false;
		if(_tmaxactive and _tminactive and ((turn + 1) == turn_max))
		{
			if(total_points >= point_min and total_points <= point_max)
			{
				_targetturn = true;	
			}
			else
			{
				_targetturn = false;	
			}
		}
		
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
		
		//if a played tile exists on the win con location
		var _winspot = true;
		with(oTileHolder)
		{
			if(winspot)
			{
				with(oTile)
				{
					if(!grabbable and instance_place(x, y, oTileHolder).winspot == true)
					{
						_winspot = true;
						break;
					}
					else
					{
						_winspot = false;	
					}
				}
			}
		}
		
		if(_p_min and _p_max and (_targetturn or (_t_min and _t_max)) and _winspot)
		{
			_win = true;	
		}
		#endregion
/*
		var _cant_play = false;
		//tilebag empty, hand empty, no tiles placed this turn, and no held tile
		if(array_length(oTilebag.match_tiles) < 1 
			and oPlayerHand.empty
			and array_length(oPlayer.placed_tiles) < 1 
			and oCursor.held_tile == noone)
		{
			_cant_play = true;	
		}*/
	
		if(_win)
		{
			oMatchManager.active = false;	
		}
		else if(((_tmaxactive and turn > turn_max) or
				(_pmaxactive and total_points > point_max)))
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
			return true;
			//audio_stop_sound(global.music_game);
			//audio_play_sound_on(global.emitterMS, global.music_victory, true, 100);
		}
	}
}