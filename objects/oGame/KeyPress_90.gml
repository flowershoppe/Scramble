if(array_length(oPlayer.placed_tiles) == 0){exit;}
if(valid_play())
{	
	var _score = calculate_points();
	if(_score > 0)
	{
		oMatchStats.total_points += _score;
		oMatchStats.last_play = _score;
	
		next_turn();
	}
}
