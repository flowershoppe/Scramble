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
			if(turn - 1 >= turn_min)
			{
				_t_min = true;	
			}
			else{_t_min = false;}
		}
		else{_t_min = true;}
		
		if(_tmaxactive)
		{
			if(turn - 1 <= turn_max)
			{
				_t_max = true;	
			}
			else{_t_max = false;}
		}
		else{_t_max = true;}
		
		var _targetturn = false;
		if(_tmaxactive and _tminactive and ((turn) == turn_max))
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
			if(!_targetturn){turn -= 1;}
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
	
		//-----LOSE-----
		if(((_tmaxactive and turn > turn_max) or
				(_pmaxactive and total_points > point_max)))
		{
			//put tiles back in bag
			with(oTile)
			{
				if(array_contains(oTilebag.tiles, id))
				{
					persistent = true;	
				}
			}
			oTilebag.yui_tiles = oTilebag.tiles;
			reset_tilebag();
			var _saveloc = "gamesave.save";
			oMatchManager.active = false;
			oMatchManager.loss = true;
			file_delete(_saveloc);
			show_debug_message("Deleting save at " + _saveloc)
			broadcast("match end");
			screenTransition(rGameOver, , ST_CHECKER_UD_BOTH);
			with(oRun){alarm_set(1, 1);}
			return true;
		}

		else
		{
			oMatchManager.loss = false;	
		}
		
		//-----WIN-----
		if(_win and !oMatchManager.loss)
		{
			instance_create_layer(0, 0, "UI", oCompleteMessage);
			oRun.levels_completed++;
			oMatchManager.victory = true;
			oMatchManager.active = false;
			//put tiles back in bag
			with(oTile)
			{
				if(array_contains(oTilebag.tiles, id))
				{
					persistent = true;	
				}
			}
			
			//MUSIC			
			audio_play_sound_on(oGame.emitter_SE, msWinChime, false, 1);			
					
			with(oMatchManager)
			{				
				wait = true;
				alarm_set(1, 120);
			}
			with(oTile)
			{
				if(on_board)
				{
					instance_create_depth(x, y, depth - 1, oShine,
					{
						alpha : 0.75,
						color : 15784459,
						fade : true
					});
				}
			}
			
			create_continue_button();
			
			broadcast("match end");	
			return true;
		}
	}
}