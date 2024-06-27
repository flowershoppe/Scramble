function next_turn()
{	
	var _player = oPlayer;
	var _placed_tiles = _player.placed_tiles;
	var _hand = oPlayerHand;
	
	with(oTile)
	{
		if(array_contains(_placed_tiles, id))
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
		while(_count < _hand.size)
		{
			add_tile_to_hand(_hand, oTilebag);
			_count++
		}
	}
	
	check_end_match();
}