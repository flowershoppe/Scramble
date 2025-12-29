function calculate_points()
{
	//-----CALCULATE POINTS-----
	var _lmult = 1;
	var _wmult = 1;
	var _subt = 0;
	var _holder = noone;
	var _total = 0;
	var _player_words_tiles = oPlayer.words_tiles;
	
	var j = 0;
	var k = 0;
	
	//review each word spelled
	for(j = 0; j < array_length(_player_words_tiles); j++)
	{
		_lmult = 1;
		_wmult = 1;
		_subt = 0;
		
		//review each letter of the word
		for(k = 0; k < array_length(_player_words_tiles[j]); k++)
		{
			oMatchManager.total_tiles++;
			oRun.tiles_played++;
			oStats.tiles_played++;
			
			with(_player_words_tiles[j][k])
			{
				var _points = pointvalue;
				
				_holder = instance_place(x, y, oTileHolder);				
				//factor in the holder's multipliers
				_lmult = _holder.lmult;
				_lmult *= oPlayer.letter_mult_bonus;
				_points += oPlayer.letter_point_bonus;
				_points *= _lmult;	
				_wmult *= _holder.wmult;
				
				//subtotal
				_subt += _points;
				
				//get coins
				with(_holder)
				{
					if(place_meeting(x, y, oCoin))
					{
						var _coin = instance_place(x, y, oCoin);
						oPlayer.money += _coin.value;
						instance_destroy(_coin);
					}
				}
				_holder.visible = false;
			}
		}
		
		_subt += oPlayer.word_point_bonus[j];
		_wmult *= oPlayer.word_mult_bonus[j];
		_subt *= _wmult;
		_total += _subt;
	}
	
	//post-calc play bonuses
	_total += oPlayer.play_point_bonus;
	_total *= oPlayer.play_mult_bonus;
	
	//reset bonuses
	oPlayer.letter_point_bonus = 0;
	oPlayer.letter_mult_bonus = 1;
	
	oPlayer.word_point_bonus = [];
	oPlayer.word_mult_bonus = [];

	oPlayer.play_point_bonus = 0;
	oPlayer.play_mult_bonus = 1;
	
	//update stats	
	oMatchManager.total_words += array_length(_player_words_tiles);		
	if(_total > oMatchManager.largest_play){oMatchManager.largest_play = _total;}
	
	oRun.words_spelled += array_length(_player_words_tiles);
	oRun.total_score += _total;
	if(_total > oRun.largest_play){oRun.largest_play = _total;}
	
	//update profile stats
	oStats.words_spelled += array_length(_player_words_tiles);
	
	//animation
	with(oMatchManager){alarm_set(0, 1);}
	
	broadcast("calculate points");
	return _total;
}